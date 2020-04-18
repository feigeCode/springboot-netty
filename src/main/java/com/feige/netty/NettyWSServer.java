package com.feige.netty;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 服务端
 * 1.创建一个ServerBootstrap的实例引导和绑定服务器。
 * 2.创建并分配一个NioEventLoopGroup实例以进行事件的处理，比如接受连接以及读写数据。
 * 3.指定服务器绑定的本地的InetSocketAddress。
 * 4.使用一个EchoServerHandler的实例初始化每一个新的Channel。
 * 5.调用ServerBootstrap.bind()方法以绑定服务器。
 */
@Component
@Slf4j
public class NettyWSServer {
    @Resource
    private WSServerInitializer wsServerInitializer;

    /**
     * NioEventLoop并不是一个纯粹的I/O线程，它除了负责I/O的读写之外
     * 创建了两个NioEventLoopGroup，
     * 它们实际是两个独立的Reactor线程池。
     * 一个用于接收客户端的TCP连接，
     * 另一个用于处理I/O相关的读写操作，或者执行系统Task、定时任务Task等。
     */
    private EventLoopGroup parentGroup;
    private EventLoopGroup childGroup;
    private ChannelFuture future = null;
    @Value("${server.netty.port}")
    private int initPort;
    @Value("${server.netty.host}")
    private String host;

    public ChannelFuture start() throws InterruptedException {
        parentGroup = new NioEventLoopGroup();
        childGroup = new NioEventLoopGroup();
        //ServerBootstrap负责初始化netty服务器，并且开始监听端口的socket请求
        ServerBootstrap server = new ServerBootstrap();
        server.group(parentGroup,childGroup)
                .localAddress(this.host,this.initPort)
                //配置双向通道
                .channel(NioServerSocketChannel.class)
                //为监听客户端read/write事件的Channel添加用户自定义的ChannelHandler
                .childHandler(wsServerInitializer);
        System.out.println(this.initPort);
        future = server.bind().sync();
        log.info("netty websocket server 在"+this.host+":"+this.initPort+"地址启动完毕....");
        return future;
    }
    public void destroy(){
        log.info("Shutdown Netty Server...");
        if (future != null){
            future.channel().close();
        }
        parentGroup.shutdownGracefully();
        childGroup.shutdownGracefully();
        log.info("Shutdown Netty Server...");
    }
}
