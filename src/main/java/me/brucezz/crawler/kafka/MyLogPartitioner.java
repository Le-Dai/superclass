package me.brucezz.crawler.kafka;


import kafka.producer.Partitioner;
import kafka.utils.VerifiableProperties;
import org.apache.log4j.Logger;

public class MyLogPartitioner implements Partitioner {
    private static Logger logger = Logger.getLogger(MyLogPartitioner.class);

    public MyLogPartitioner(VerifiableProperties props) {
    }

    public int partition(Object key, int numPartitions) {
        return key.toString().hashCode()%numPartitions;
    }
}
