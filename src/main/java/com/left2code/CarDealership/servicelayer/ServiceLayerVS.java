/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.left2code.CarDealership.servicelayer;

import com.left2code.CarDealership.model.Special;
import com.left2code.CarDealership.model.User;
import com.left2code.CarDealership.model.Room;
import com.left2code.CarDealership.model.RoomBuilding;
import java.util.List;

/**
 * @author Stephon Fonrose
 * @author Adem Coklar
 */

public interface ServiceLayerVS {
    
    Room addRoom(Room Room);
    
    void updateRoom(Room room);
    void removeRoom(Room room);
    
    List<RoomBuilding> getBuildings();
    List<Room> getAllRooms();
    Room getRoomById(int id);
    List<Room> getFeaturedRooms(); //Service Method
    List<Room> getRoomsOfType(List<Room> rooms, boolean isNew); //Service Method
    List<Room> getRoomsByQuery(String search, int[] params);
 
}
 