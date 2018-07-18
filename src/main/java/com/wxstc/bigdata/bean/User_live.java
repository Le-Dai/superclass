package com.wxstc.bigdata.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("user_live")
public class User_live extends Model<User_live>{
    public long inactive;
    public long more_active;
    public long very_active;

    public long getInactive() {
        return inactive;
    }

    public void setInactive(long inactive) {
        this.inactive = inactive;
    }

    public long getMore_active() {
        return more_active;
    }

    public void setMore_active(long more_active) {
        this.more_active = more_active;
    }

    public long getVery_active() {
        return very_active;
    }

    public void setVery_active(long very_active) {
        this.very_active = very_active;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }
}
