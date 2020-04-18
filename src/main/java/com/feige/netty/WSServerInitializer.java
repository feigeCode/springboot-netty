package com.feige.netty;

import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class WSServerInitializer extends ChannelInitializer<SocketChannel> {
    //注入自定义的助手类
    @Resource
    private ChatHandler chatHandler;


    protected void initChannel(SocketChannel socketChannel) throws Exception {
        ChannelPipeline pipeline = socketChannel.pipeline();
        //基于http协议，所以要有http编码解码器
        pipeline.addLast(new HttpServerCodec());
        //对写大数据的支持
        pipeline.addLast(new ChunkedWriteHandler());
        //对httpMessage进行聚合，聚合成FullHttpRequest或FullHttpResponse
        pipeline.addLast(new HttpObjectAggregator(1024*64));
        //==============以上是用于支持http协议=============
        //websocket服务器处理的协议，用于指定给客户端连接访问的路由：/ws
        //本handler会帮你处理一些繁重的的复杂的事
        //会帮你处理握手动作：handshaking(close,ping,pong)ping + pong = 心跳
        //对于websocket来讲，都是以frames进行传输的，不同的数据类型对应的frames也不同
        pipeline.addLast(new WebSocketServerProtocolHandler("/ws"));
        //自定义的handler
        pipeline.addLast(chatHandler);
    }
}
