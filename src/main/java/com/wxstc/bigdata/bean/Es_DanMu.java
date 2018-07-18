package com.wxstc.bigdata.bean;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.io.Serializable;
import java.util.Date;

@Document(indexName="dy-danmu",type="dy_danmu",indexStoreType="fs",shards=5,replicas=1,refreshInterval="-1")
public class Es_DanMu implements Serializable {
    @Id
    public String id;
    public long uid;
    public String content;
    public long rid;
    public String snick;
    public Date date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getUid() {
        return uid;
    }

    public void setUid(long uid) {
        this.uid = uid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getRid() {
        return rid;
    }

    public void setRid(long rid) {
        this.rid = rid;
    }

    public String getSnick() {
        return snick;
    }

    public void setSnick(String snick) {
        this.snick = snick;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Es_DanMu{" +
                "id='" + id + '\'' +
                ", uid=" + uid +
                ", content='" + content + '\'' +
                ", rid=" + rid +
                ", snick='" + snick + '\'' +
                ", date=" + date +
                '}';
    }
}
