package me.brucezz.crawler.util;

import java.util.HashMap;

public class MyHashMap extends HashMap{
    private HashMap map = null;
    public MyHashMap(HashMap map){
        this.map = map;
    }
    public Object getOrElse(String key,Object o){
        Object v = map.get(key);
        return v==null?o:v;
    }
}
