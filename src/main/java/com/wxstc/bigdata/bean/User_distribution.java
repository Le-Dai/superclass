package com.wxstc.bigdata.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("user_distribution")
public class User_distribution extends Model<User_distribution>{
    public int id;
    public long all_count;
    public long girl_count;
    public long man_count;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getAll_count() {
        return all_count;
    }

    public void setAll_count(long all_count) {
        this.all_count = all_count;
    }

    public long getGirl_count() {
        return girl_count;
    }

    public void setGirl_count(long girl_count) {
        this.girl_count = girl_count;
    }

    public long getMan_count() {
        return man_count;
    }

    public void setMan_count(long man_count) {
        this.man_count = man_count;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }
}
