package com.project.config;

import java.security.SecureRandom;

import org.springframework.context.annotation.Configuration;

@Configuration
public class PasswordGenerator {

	private static final String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
    private static final String CHAR_UPPER = CHAR_LOWER.toUpperCase();
    private static final String NUMBER = "0123456789";
    //private static final String OTHER_CHAR = "!@#$%&*()_+-=[]?";

    private static final String PASSWORD_ALLOW_BASE = CHAR_LOWER + CHAR_UPPER + NUMBER;

    private static SecureRandom random = new SecureRandom();

    public String generateRandomPassword(int length) {
        if (length < 1) throw new IllegalArgumentException();

        StringBuilder sb = new StringBuilder(length);
        
        for (int i = 0; i < length; i++) {
            int rndCharAt = random.nextInt(PASSWORD_ALLOW_BASE.length());
            char rndChar = PASSWORD_ALLOW_BASE.charAt(rndCharAt);
            sb.append(rndChar);
        }
        return sb.toString();
    }
}