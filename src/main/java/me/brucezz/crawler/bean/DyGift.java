package me.brucezz.crawler.bean;

import java.io.Serializable;
import java.util.Date;

public class DyGift implements Serializable{
    public int uid;
    public int gid;
    public String nickName;
    public String giftName;
    public int rid;
    public String bid;
    public int sid;
    public Long time;
    public int giftType; //1= 全局广播  2=直播间runkup  3= 小礼物
    public DyGift(){
        super();
    }

    public DyGift(int uid,int gid,String nickName,String giftName,int rid,String bid,int sid,int giftType){
        this.uid = uid;
        this.gid = gid;
        this.nickName = nickName;
        this.giftName = giftName;
        this.rid = rid;
        this.bid = bid;
        this.sid = sid;
        this.giftType = giftType;
        this.time = new Date().getTime();
    }

    @Override
    public String toString() {
        return "DyGift{" +
                "uid=" + uid +
                ", gid=" + gid +
                ", nickName='" + nickName + '\'' +
                ", giftName='" + giftName + '\'' +
                ", rid=" + rid +
                ", bid='" + bid + '\'' +
                ", sid=" + sid +
                '}';
    }
}
