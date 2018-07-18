package com.wxstc.bigdata.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.SqlHelper;
import com.wxstc.bigdata.bean.LaGou_job;
import com.wxstc.bigdata.bean.Lagou_companycate;
import com.wxstc.bigdata.mapper.Lagou_companycateMapper;
import com.wxstc.bigdata.mapper.Lagou_jobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
public class LaGouController {
    @Autowired
    private Lagou_companycateMapper lagou_companycateMapper;
    @Autowired
    private Lagou_jobMapper lagou_jobMapper;
    @RequestMapping("/lagou/lagoucompany/getCompanyXinAndType")
    @ResponseBody
    private Map getCompanyXinAndType(String types) {
        if (!"".equals(types)) {
            Map result = new LinkedHashMap();
            Map allresult = new LinkedHashMap();
            Long k1 = 0L;
            Long k2 = 0L;
            Long k3 = 0L;
            Long k4 = 0L;
            Long k5 = 0L;
            Long k6 = 0L;
            String[] split = types.split(",");
            List<LaGou_job> leix = new LinkedList<LaGou_job>();
            List<LaGou_job> lagou_companycates = lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().in("type", split));
            for (LaGou_job job : lagou_companycates) {
                if (job.type == 3) {
                    int max = 0;
                    int min = 0;
                    if (job.name.contains("-")) {
                        job.name = job.name.replace("以上", "").replace("K", "").replace("k", "");
                        String[] split1 = job.name.split("-");
                        if (split1.length == 2) {
                            min = new Integer(split1[0]);
                            max = new Integer(split1[1]);
                        }
                    } else if (job.name.contains("以上") && !job.name.contains("-")) {
                        job.name = job.name.replace("以上", "").replace("K", "").replace("k", "");
                        min = new Integer(job.name);
                    } else if (job.name.contains("以下") && !job.name.contains("-")) {
                        job.name = job.name.replace("以下", "").replace("K", "").replace("k", "");
                        max = new Integer(job.name);
                    }
                    //***以上
                    if (max == 0) {
                        if (min < 5) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                            k6 += new Long(job.value);
                        } else if (min < 10) {
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                        } else if (min < 30) {
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                            k6 += new Long(job.value);
                        } else if (min < 50) {
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                            k6 += new Long(job.value);
                        } else if (min < 100) {
                            k5 += new Long(job.value);
                            k6 += new Long(job.value);
                        } else if (min >= 100) {
                            k6 += new Long(job.value);
                        }
                        continue;
                    }
                    //**以下
                    if (min == 0) {
                        if (max < 5) {
                            k1 += new Long(job.value);
                        } else if (max <= 10) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                        } else if (max <= 30) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                        } else if (max <= 50) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                        } else if (max <= 100) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                        } else if (max > 100) {
                            k1 += new Long(job.value);
                            k2 += new Long(job.value);
                            k3 += new Long(job.value);
                            k4 += new Long(job.value);
                            k5 += new Long(job.value);
                            k6 += new Long(job.value);
                        }
                        continue;
                    }
                    //*-*
                    if (min != 0 && max != 0) {
                        if (min > 100) {
                            k6 += new Long(job.value);
                        } else if (min > 50) {
                            if (max > 100) {
                                k5 += new Long(job.value);
                                k6 += new Long(job.value);
                            } else if (max <= 100) {
                                k5 += new Long(job.value);
                            }
                        } else if (min > 30) {
                            if (max > 100) {
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                                k6 += new Long(job.value);
                            } else if (max <= 50) {
                                k4 += new Long(job.value);
                            } else if (max <= 100) {
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                            }
                        } else if (min > 10) {
                            if (max > 100) {
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                                k6 += new Long(job.value);
                            } else if (max <= 30) {
                                k3 += new Long(job.value);
                            } else if (max <= 50) {
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                            } else if (max <= 100) {
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                            }
                        } else if (min > 5) {
                            if (max > 100) {
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                                k6 += new Long(job.value);
                            } else if (max <= 10) {
                                k2 += new Long(job.value);
                            } else if (max <= 30) {
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                            } else if (max <= 50) {
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                            } else if (max <= 100) {
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                            }
                        } else if (min > 0) {
                            if (max <= 5) {
                                k1 += new Long(job.value);
                            } else if (min > 0 && max <= 10) {
                                k1 += new Long(job.value);
                                k2 += new Long(job.value);
                            } else if (min > 0 && max <= 30) {
                                k1 += new Long(job.value);
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                            } else if (min > 0 && max <= 50) {
                                k1 += new Long(job.value);
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                            } else if (min > 0 && max <= 100) {
                                k1 += new Long(job.value);
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                            } else if (min > 0 && max <= 500) {
                                k1 += new Long(job.value);
                                k2 += new Long(job.value);
                                k3 += new Long(job.value);
                                k4 += new Long(job.value);
                                k5 += new Long(job.value);
                                k6 += new Long(job.value);
                            }
                        }

                        continue;
                    }
                    System.out.println("----------------------------");
                } else if (job.type == 4) {
                    leix.add(job);
                }
            }
            result.put("0K-5K", k1);
            result.put("5K-10K", k2);
            result.put("10K-30K", k3);
            result.put("30K-50K", k4);
            result.put("50K-100K", k5);
            result.put("100K以上", k6);
            allresult.put("3", result);
            allresult.put("4", leix);
            return allresult;
        }
        return null;
    }

    public void plusLong(Long[] args, LaGou_job job) {
        System.out.println(args.length);
        for (Long l : args) {
            l += new Long(job.value);
        }
    }

    @RequestMapping("/lagou/lagoucompany/getJingYanXueLi")
    @ResponseBody
    private Map getJingYanXueLi() {
        Map result = new LinkedHashMap();
        List jingy = new LinkedList();
        List xueli = new LinkedList();
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验不限"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验应届毕业生"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验1年以下"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验1-3年"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验3-5年"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验5-7年"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验5-10年"))));
        jingy.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 2)
                .eq("name","经验10年以上"))));
        //经验
        result.put("2",jingy);
        //学历
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","学历不限"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","初中及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","中专及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","高中及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","大专及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","本科及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","硕士及以上"))));
        xueli.add(SqlHelper.getObject(lagou_jobMapper.selectList(new EntityWrapper<LaGou_job>().eq("type", 5)
                .eq("name","博士及以上"))));
        result.put("5",xueli);
        return result;
    }

    @RequestMapping("/lagou/lagoucompany/getCommpanyArea")
    @ResponseBody
    public List<Lagou_companycate> getCommpanyArea(){
        List<Lagou_companycate> company_area = lagou_companycateMapper.selectList(new EntityWrapper<Lagou_companycate>().eq("type", 2));
        return company_area;
    }

    @RequestMapping("/lagou/lagoucompany/getCommpanygui")
    @ResponseBody
    public Map getCommpanygui(){
        Map result = new LinkedHashMap();
        List<Lagou_companycate> company_rongzi = lagou_companycateMapper.selectList(new EntityWrapper<Lagou_companycate>().eq("type", 3));
        List<Lagou_companycate> company_guimo = lagou_companycateMapper.selectList(new EntityWrapper<Lagou_companycate>().eq("type", 4));
        result.put("3",company_rongzi);
        result.put("4",company_guimo);
        return result;
    }
}
