package com.wxstc.bigdata.bean;

import java.io.Serializable;

public class GiftSum implements Serializable {

    public String giftName;
    public long number;

    public GiftSum(){
        super();
    }
    public GiftSum(String giftName, long number){
        this.giftName = giftName;
        this.number = number;
    }
    public String getGiftName() {
        return giftName;
    }

    public void setGiftName(String giftName) {
        this.giftName = giftName;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }
}
