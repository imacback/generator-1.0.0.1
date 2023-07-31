package com.bwton.generator;

/**
 * @author xushaobo@bwton.com
 * @date 2023/7/31 15:11
 */
public class GeneratorServer {
    public static void main(String[] args) {
        try {
            GeneratorFactory.getInstance().create();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
