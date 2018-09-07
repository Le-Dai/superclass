package me.brucezz.crawler.config;


import me.brucezz.crawler.util.LogUtil;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

/**
 * Created by Brucezz on 2016/01/04.
 * DouyuCrawler
 */
public class Config {
    private static final String PROPERTIES_NAME = "src/conf.properties";
    public static boolean loadSuccess = false;
    public static boolean DEBUG_MODE = false;
    public static String File_Path = null;
    public static boolean DB_ENABLE = false;
    public static String DB_NAME = null;
    public static String DB_USERNAME = null;
    public static String DB_PASSWORD = null;
    public static String COMMANY_PATH = null;

    /**
     * 键  房间简称( 即room.url.XXX中的XXX )
     * 值  房间地址
     */
    public static Map<String, String> ROOM_MAP = new HashMap<String, String>();

//    static {
//        InputStream in = null;
//        try {
//            Properties properties = new Properties();
//            ClassLoader cl = Config.class.getClassLoader();
//            InputStream in2 = cl.getResourceAsStream("conf.properties");
////            in = new FileInputStream(new File(PROPERTIES_NAME));
//            properties.load(in2);
//
//            DEBUG_MODE = Boolean.parseBoolean(properties.getProperty("debug"));
//
//            DB_ENABLE = Boolean.parseBoolean(properties.getProperty("db.enable"));
//            DB_NAME = properties.getProperty("db.name");
//            DB_USERNAME = properties.getProperty("db.username");
//            DB_PASSWORD = properties.getProperty("db.password");
//            File_Path = properties.getProperty("superclass.filepath");
//            COMMANY_PATH = properties.getProperty("commany.filepath");
//            Set<Object> objects = properties.keySet();
//            for (Object object : objects) {
//                String key = ((String) object).trim();
//                if (!key.startsWith("room.url.") || key.length() <= 9) continue;
//
//                ROOM_MAP.put(key.substring(9), properties.getProperty(key));
//            }
//
//            loadSuccess = true;
//            LogUtil.i("读取配置信息成功！");
//
//            showConfig();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            LogUtil.w("读取配置信息失败！");
//        } finally {
//            if (in != null) {
//                try {
//                    in.close();
//                } catch (IOException e) {
//                    LogUtil.e(e.toString());
//                }
//            }
//        }
//    }

    private static void showConfig() {
        LogUtil.d("Config", "----------------------------------------------------------------");

        LogUtil.d("Config", "DEBUG_MODE: " + DEBUG_MODE);
        LogUtil.d("Config", "DB_ENABLE: " + DB_ENABLE);
        Set<String> nameSet = ROOM_MAP.keySet();
        for (String name : nameSet) {
            LogUtil.d("Config", "ROOM_URL: " + name + " >> " + ROOM_MAP.get(name));
        }

        LogUtil.d("Config", "----------------------------------------------------------------");
    }

}
