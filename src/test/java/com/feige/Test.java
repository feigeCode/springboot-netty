package com.feige;

import java.util.UUID;

public class Test {
    public static void main(String[] args) {
        String code = UUID.randomUUID().toString().substring(0, 6);
        System.out.println(code);
    }
}
