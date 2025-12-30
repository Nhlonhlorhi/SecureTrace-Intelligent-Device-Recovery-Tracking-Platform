package com.securetrace.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
@Tag(name = "SecureTrace API", description = "Device Recovery Tracking Platform")
public class SecureTraceController {
    
    @GetMapping("/health")
    @Operation(summary = "Health check endpoint")
    public Map<String, String> healthCheck() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "UP");
        response.put("service", "SecureTrace API");
        response.put("timestamp", LocalDateTime.now().toString());
        response.put("version", "1.0.0");
        return response;
    }
    
    @GetMapping("/welcome")
    @Operation(summary = "Welcome message")
    public Map<String, String> welcome() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Welcome to SecureTrace - Intelligent Device Recovery Tracking Platform");
        response.put("description", "Cross-platform device recovery and tracking system");
        response.put("status", "Operational");
        return response;
    }
    
    @PostMapping("/echo")
    @Operation(summary = "Echo back received data")
    public Map<String, Object> echo(@RequestBody Map<String, Object> data) {
        Map<String, Object> response = new HashMap<>(data);
        response.put("receivedAt", LocalDateTime.now().toString());
        response.put("processedBy", "SecureTrace API");
        return response;
    }
}
