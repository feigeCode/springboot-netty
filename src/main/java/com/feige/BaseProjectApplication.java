package com.feige;

import com.feige.netty.NettyWSServer;
import io.netty.channel.ChannelFuture;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.Resource;

/**
 * Springboot启动服务端代码
 * CommandLineRunner #run()
 * 这里主要是通过CommandLineRunner 接口的run方法，实现在项目启动后执行的功能，
 * SpringBoot提供的一种简单的实现方案就是添加一个model并实现CommandLineRunner接口，
 * 实现功能的代码放在实现的run方法中。
 * addShutdownHook()
 * Runtime.getRuntime().addShutdownHook(shutdownHook);
 * 这个方法的意思就是在jvm中增加一个关闭的钩子，当jvm关闭的时候，
 * 会执行系统中已经设置的所有通过方法addShutdownHook添加的钩子，
 * 当系统执行完这些钩子后，jvm才会关闭。
 * 所以这些钩子可以在jvm关闭的时候进行内存清理、
 * 对象销毁等操作。
 */
@SpringBootApplication
public class BaseProjectApplication implements CommandLineRunner {

    @Resource
    private NettyWSServer nettyWSServer;
    public static void main(String[] args) {
        SpringApplication.run(BaseProjectApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        ChannelFuture future = nettyWSServer.start();
        Runtime.getRuntime().addShutdownHook(new Thread(() -> nettyWSServer.destroy()));
        //服务端管道关闭的监听器并同步阻塞,直到channel关闭,线程才会往下执行,结束进程
        future.channel().closeFuture().syncUninterruptibly();
    }
}
