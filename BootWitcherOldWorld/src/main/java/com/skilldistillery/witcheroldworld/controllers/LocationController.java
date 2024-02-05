package com.skilldistillery.witcheroldworld.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.skilldistillery.witcheroldworld.data.LocationDAO;
import com.skilldistillery.witcheroldworld.entities.Location;

public class LocationController {

    @Autowired
    private LocationDAO locationDao;

//    @GetMapping
//    public List<Location> listLocations() {
//        return locationDao.findAllLocations();
//    }

    @GetMapping("/{id}")
    public Location getLocationById(@PathVariable int id) {
        return locationDao.findById(id);
    }
	
	
}
