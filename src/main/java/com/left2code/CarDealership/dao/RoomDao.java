/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.left2code.CarDealership.dao;

import com.left2code.CarDealership.model.Room;
import com.left2code.CarDealership.model.User;
import com.left2code.CarDealership.model.RoomBuilding;
import java.util.List;

/**
 * @author Stephon Fonrose
 * @author Adem Coklar
 */
public interface RoomDao {
    Room getRoomById(int id);
    List<Room> getAllRooms();
    Room addRoom(Room room);
    void updateRoom(Room room);
    void removeRoom(Room room);
    List<Room> getRoomsByQuery(String search, int[] params);
    
    void addOccupancy(int occupancy, User user);
    void addBuilding(String name, int floors, int rooms);
    List<RoomBuilding> getBuildings();
}