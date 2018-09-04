package com.wxstc.bigdata.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.wxstc.bigdata.bean.SchoolCountByProvince;
import com.wxstc.bigdata.bean.School_count;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface school_countMapper extends BaseMapper<School_count> {
    @Select("SELECT * FROM ( SELECT SUM(number) AS value, province as name FROM school_count WHERE province <> '' GROUP BY province ) a WHERE a.value > #{0} AND a.value <= #{1}")
    public List<SchoolCountByProvince> schoolCountByProvince(long min, long max);
}
