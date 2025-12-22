package com.securetrace.controller;

import com.securetrace.model.Device;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/devices")
public class DeviceController {
    
    private List<Device> devices = new ArrayList<>();
    
    @GetMapping
    public List<Device> getAllDevices() {
        return devices;
    }
    
    @PostMapping
    public Device registerDevice(@RequestBody Device device) {
        devices.add(device);
        return device;
    }
    
    @GetMapping("/{id}")
    public Device getDevice(@PathVariable Long id) {
        return devices.stream()
                .filter(d -> d.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
    
    @PutMapping("/{id}/status")
    public Device updateStatus(@PathVariable Long id, @RequestParam String status) {
        Device device = getDevice(id);
        if (device != null) {
            device.setStatus(status);
        }
        return device;
    }
}
