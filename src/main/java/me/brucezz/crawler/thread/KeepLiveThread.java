package me.brucezz.crawler.thread;

import me.brucezz.crawler.bean.Request;
import me.brucezz.crawler.handler.MessageHandler;
import me.brucezz.crawler.util.LogUtil;

import java.net.Socket;

/**
 * Created by Brucezz on 2016/01/04.
 * DouyuCrawler
 */
public class KeepLiveThread implements Runnable {
    private Socket s;

    public KeepLiveThread(Socket s) {
        this.s = s;
    }

    public void run() {

        LogUtil.i("KeepLive", "心跳包线程启动 ...");

        while (s != null && s.isConnected()) {
            try {
                Thread.sleep(40000);
                MessageHandler.send(s, Request.keepLive((int) (System.currentTimeMillis() / 1000)));
                LogUtil.d("KeepLive", "Keep Live ...");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}