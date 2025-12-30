package com.securetrace.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Table(name = "devices")
@Data
public class Device {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String deviceName;
    
    @Column(nullable = false, unique = true)
    private String serialNumber;
    
    @Column(nullable = false)
    private String deviceType; // MOBILE, DESKTOP, LAPTOP
    
    @Column(nullable = false)
    private String status = "PENDING"; // PENDING, VERIFIED, LOST, RECOVERED, WIPED
    
    @Column(name = "owner_email")
    private String ownerEmail;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt = LocalDateTime.now();
    
    @Column(name = "last_seen")
    private LocalDateTime lastSeen;
    
    @Column(name = "is_active")
    private boolean active = true;
    
    public void updateLastSeen() {
        this.lastSeen = LocalDateTime.now();
    }
}
