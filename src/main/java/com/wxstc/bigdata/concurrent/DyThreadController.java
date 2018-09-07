package com.wxstc.bigdata.concurrent;

import kafka.javaapi.producer.Producer;
import kafka.producer.ProducerConfig;
import me.brucezz.crawler.thread.CrawlerThread;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Controller
public class DyThreadController {
    public static Properties kafkaPro = null;
    public static String TOPIC = "dy_danmu";
    public static String GIFTTOPIC = "dy_gift";
    public static boolean DANMUTOKAFKA = false;
    public static boolean GIFTTOKAFKA = false;
    /**
     * 3、通过配置文件，创建生产者
     */

    public static Producer<String, String> producer = null;
    static {
        kafkaPro = new Properties();
        /*
         * key.serializer.class默认为serializer.class
		 */
        kafkaPro.put("serializer.class", "kafka.serializer.StringEncoder");
        /*
		 * kafka broker对应的主机，格式为host1:port1,host2:port2
		 */
        kafkaPro.put("metadata.broker.list", "hadoop01:9092,hadoop02:9092,hadoop03:9092");
        /*
         * request.required.acks,设置发送数据是否需要服务端的反馈,有三个值0,1,-1
		 * 0，意味着producer永远不会等待一个来自broker的ack，这就是0.7版本的行为。
		 * 这个选项提供了最低的延迟，但是持久化的保证是最弱的，当server挂掉的时候会丢失一些数据。
		 * 1，意味着在leader replica已经接收到数据后，producer会得到一个ack。
		 * 这个选项提供了更好的持久性，因为在server确认请求成功处理后，client才会返回。
		 * 如果刚写到leader上，还没来得及复制leader就挂了，那么消息才可能会丢失。
		 * -1，意味着在所有的ISR都接收到数据后，producer才得到一个ack。
		 * 这个选项提供了最好的持久性，只要还有一个replica存活，那么数据就不会丢失
		 */
        kafkaPro.put("request.required.acks", "1");
        /*
		 * 可选配置，如果不配置，则使用默认的partitioner partitioner.class
		 * 默认值：kafka.producer.DefaultPartitioner
		 * 用来把消息分到各个partition中，默认行为是对key进行hash。
		 */
        kafkaPro.put("partitioner.class", "me.brucezz.crawler.kafka.MyLogPartitioner");
//        props.put("partitioner.class", "kafka.producer.DefaultPartitioner");
        producer = new Producer<String, String>(new ProducerConfig(kafkaPro));
    }
    public static Map<String, String> ROOM_MAP = new HashMap<String, String>();
//    public static Queue<String> sb = new LinkedList<String>();
    public static ExecutorService cachedThreadPool = Executors.newCachedThreadPool();
    public static ArrayList<Thread> threads = new ArrayList<Thread>();
    public static ArrayList<CrawlerThread> crawlerThreads = new ArrayList<CrawlerThread>();
    //提交线程
    public static void addThread(CrawlerThread crawlerThread,String name){
        Thread thread = new Thread(crawlerThread, "Crawler-" + name);
        thread.start();
        threads.add(thread);
        crawlerThreads.add(crawlerThread);
    }

    //清空所有任务
    public static void clearThreads(){
        Iterator<Thread> iterator = threads.iterator();
        while (iterator.hasNext()){
            Thread next = iterator.next();
            next.stop();
            iterator.remove();
        }
        Iterator<CrawlerThread> it2 = crawlerThreads.iterator();
        while (it2.hasNext()){
            CrawlerThread next = it2.next();
            if(next.keepLiveThread!=null)
                next.keepLiveThread.stop();
            it2.remove();
        }
    }

//    @RequestMapping("/douyu/thread/getOut")
//    public void getOut(HttpServletResponse response) throws IOException {
//        PrintWriter writer = response.getWriter();
//        response.setContentType("text/html;charset=utf-8");
//        while (true){
//            String poll = sb.poll();
//            if(poll!=null){
//                writer.write(poll);
//                writer.flush();
//            }
//        }
//    }

    @RequestMapping("/douyu/danmu/setDyDanMu")
    @ResponseBody
    public String setDyDanMu(HttpServletResponse response, String url) throws IOException {
        String[] split = url.split(",");
        ROOM_MAP.clear();
        for (String u:split) {
            ROOM_MAP.put(u.substring(u.indexOf("/"),u.length()),u);
        }
        return "success";
    }

    @RequestMapping("/douyu/danmu/DyDanMuProcess")
    @ResponseBody
    public String DyDanMuProcess(HttpServletResponse response,String action) throws IOException {
        if(action.equals("1")){
            DyThreadController.clearThreads();
            Set<String> nameSet = ROOM_MAP.keySet();
            int i =0;
            for (String name : nameSet) {
                CrawlerThread crawlerThread = new CrawlerThread(name, ROOM_MAP.get(name));
                crawlerThread.threadId = i;
                DyThreadController.addThread(crawlerThread,name);
                i++;
            }
        }else if(action.equals("0")){
            DyThreadController.clearThreads();
        }
        return "success";
    }

//    public static void main(String[] args) throws InterruptedException {
//        ROOM_MAP.put("room.url.shiyuan","https://www.douyu.com/921393");//https://www.douyu.com/885443
//        /**
//         * 1、指定当前kafka producer生产的数据的目的地
//         *  创建topic可以输入以下命令，在kafka集群的任一节点进行创建。
//         *  bin/kafka-topics.sh --create --zookeeper zk01:2181 --replication-factor 1 --partitions 1 --topic test
//         */
//
//
//        Thread.sleep(240000);
//        DyThreadController.clearThreads();
//
//        System.out.println("213");
//    }
}
