package com.securetrace.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "devices")
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
    private String status; // PENDING, VERIFIED, LOST, RECOVERED, WIPED
    
    @Column(name = "owner_email")
    private String ownerEmail;
    
    @Column(name = "imei_encrypted")
    private String imeiEncrypted;
    
    @Column(name = "mac_address_encrypted")
    private String macAddressEncrypted;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "last_seen")
    private LocalDateTime lastSeen;
    
    @Column(name = "is_active")
    private boolean isActive = true;
    
    // Constructors
    public Device() {
        this.createdAt = LocalDateTime.now();
    }
    
    public Device(String deviceName, String serialNumber, String deviceType, String ownerEmail) {
        this();
        this.deviceName = deviceName;
        this.serialNumber = serialNumber;
        this.deviceType = deviceType;
        this.ownerEmail = ownerEmail;
        this.status = "PENDING";
    }
    
    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public String getDeviceName() { return deviceName; }
    public void setDeviceName(String deviceName) { this.deviceName = deviceName; }
    
    public String getSerialNumber() { return serialNumber; }
    public void setSerialNumber(String serialNumber) { this.serialNumber = serialNumber; }
    
    public String getDeviceType() { return deviceType; }
    public void setDeviceType(String deviceType) { this.deviceType = deviceType; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getOwnerEmail() { return ownerEmail; }
    public void setOwnerEmail(String ownerEmail) { this.ownerEmail = ownerEmail; }
    
    public String getImeiEncrypted() { return imeiEncrypted; }
    public void setImeiEncrypted(String imeiEncrypted) { this.imeiEncrypted = imeiEncrypted; }
    
    public String getMacAddressEncrypted() { return macAddressEncrypted; }
    public void setMacAddressEncrypted(String macAddressEncrypted) { this.macAddressEncrypted = macAddressEncrypted; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public LocalDateTime getLastSeen() { return lastSeen; }
    public void setLastSeen(LocalDateTime lastSeen) { this.lastSeen = lastSeen; }
    
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}
