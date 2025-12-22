package com.securetrace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class SecureTraceApplication {
    public static void main(String[] args) {
        SpringApplication.run(SecureTraceApplication.class, args);
    }
}
