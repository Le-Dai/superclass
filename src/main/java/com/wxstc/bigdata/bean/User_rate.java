package com.wxstc.bigdata.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("user_rate")
public class User_rate extends Model<User_rate>{
    public long die;
    public long general;
    public long senior;

    public long getDie() {
        return die;
    }

    public void setDie(long die) {
        this.die = die;
    }

    public long getGeneral() {
        return general;
    }

    public void setGeneral(long general) {
        this.general = general;
    }

    public long getSenior() {
        return senior;
    }

    public void setSenior(long senior) {
        this.senior = senior;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }
}
