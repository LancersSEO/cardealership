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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.left2code.CarDealership.dao.RoomDao;
import com.left2code.CarDealership.model.Room;

/**
 * @author Stephon Fonrose
 * @author Adem Coklar
 */
@Repository
public class RoomServiceLayer implements ServiceLayerVS {

    @Autowired
    RoomDao roomDao;


    @Override
    public Room addRoom(Room room) {
        return roomDao.addRoom(room);
    }

    @Override
    public void updateRoom(Room room) {
        roomDao.updateRoom(room);
    }

    @Override
    public void removeRoom(Room room) {
        roomDao.removeRoom(room);
    }


    @Override
    public List<RoomBuilding> getBuildings() {
        return roomDao.getBuildings();
    }

    @Override
    public List<Room> getAllRooms() {
        return roomDao.getAllRooms();
    }
    

    @Override
    public Room getRoomById(int id) {
        return roomDao.getRoomById(id);
    }

    @Override
    public List<Room> getRoomsByQuery(String search, int[] params) {
        return roomDao.getRoomsByQuery(search, params);
    }

    @Override
    public List<Room> getFeaturedRooms() {
        List<Room> rooms = roomDao.getAllRooms();
        rooms = rooms.stream()
                .filter((v) -> v.isFeatured())
                .collect(Collectors.toList());
        return rooms;
    }

    @Override
    public List<Room> getRoomsOfType(List<Room> rooms, boolean isNew) {

        if (isNew) {
            rooms = rooms.stream()
                    .filter((v) -> v.getBuilding().equals("NYC HQ"))
                    .collect(Collectors.toList());
        } else {
            rooms = rooms.stream()
                    .filter((v) -> v.getBuilding().equals("NJ HQ"))
                    .collect(Collectors.toList());
        }

        return rooms;
    }

}
