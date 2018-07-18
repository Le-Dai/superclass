package com.wxstc.bigdata.bean;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;

@TableName("school_count")
public class School_count extends Model<School_count>{
    public int id;
    public long number;
    public String schoolName;
    public String province;
    public String level;
    public String schoolnature;
    public String guanwang;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getSchoolnature() {
        return schoolnature;
    }

    public void setSchoolnature(String schoolnature) {
        this.schoolnature = schoolnature;
    }

    public String getGuanwang() {
        return guanwang;
    }

    public void setGuanwang(String guanwang) {
        this.guanwang = guanwang;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }
}
