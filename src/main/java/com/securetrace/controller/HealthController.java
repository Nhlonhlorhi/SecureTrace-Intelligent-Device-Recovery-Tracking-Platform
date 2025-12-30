package com.securetrace.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/health")
public class HealthController {
    
    @GetMapping
    public String healthCheck() {
        return "SecureTrace API is running!";
    }
    
    @GetMapping("/version")
    public String version() {
        return "SecureTrace v1.0.0 - Device Recovery Tracking Platform";
    }
}
