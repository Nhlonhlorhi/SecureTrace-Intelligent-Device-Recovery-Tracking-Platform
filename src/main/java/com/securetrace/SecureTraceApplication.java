package com.securetrace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableScheduling
@EnableWebMvc
public class SecureTraceApplication {
    public static void main(String[] args) {
        SpringApplication.run(SecureTraceApplication.class, args);
        System.out.println("=========================================");
        System.out.println("SecureTrace Application Started!");
        System.out.println("API Documentation: http://localhost:8080/api/swagger-ui.html");
        System.out.println("H2 Database Console: http://localhost:8080/api/h2-console");
        System.out.println("JDBC URL: jdbc:h2:mem:securetrace_db");
        System.out.println("Username: sa | Password: (empty)");
        System.out.println("=========================================");
    }
}
