package com.bwton.generator.util;

/**
 * @author xushaobo@bwton.com
 * @date 2023/7/31 15:13
 */
public class StringUtil {
    public static String captureName(String name) {
        if (name.length() >= 1)
            name = name.substring(0, 1).toUpperCase() + name.substring(1);
        return name;
    }
}
