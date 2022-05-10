/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.left2code.CarDealership.dao;

import com.left2code.CarDealership.model.Room;
import com.left2code.CarDealership.model.User;
import com.left2code.CarDealership.model.RoomBuilding;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Stephon Fonrose
 * @author Adem Coklar
 */
@Repository
public class RoomDaoDB implements RoomDao {

    @Autowired
    JdbcTemplate jdbc;

    @Override
    public Room getRoomById(int roomID) {
        final String GET_ROOM = "SELECT * from room WHERE roomID = ?";
        return jdbc.queryForObject(GET_ROOM, new RoomMapper(), roomID);
    }

    @Override
    public List<Room> getAllRooms() {
        final String GET_ROOMS = "SELECT * from room";
        return jdbc.query(GET_ROOMS, new RoomMapper());
    }

    @Override
    @Transactional
    public Room addRoom(Room room) {
        final String ADD_ROOM = "INSERT INTO room "
                + "(`maxOccupancy`, `roomNum`, `building`, `floorNum`"
                + "`imageLink`)"
                + "VALUES (?,?,?,?,?)";
        final String LAST_ID = "SELECT LAST_INSERT_ID()";

        jdbc.update(ADD_ROOM, room.getMaxOccupancy(),
                room.getRoomNum(), room.getBuilding(), room.getFloorNum(), 
                room.getImageLink());

        int roomRecordID = jdbc.queryForObject(LAST_ID, Integer.class);
        room.setRoomID(roomRecordID);
        return room;

    }

    @Override
    public void updateRoom(Room room) {
        final String UPDATE_ROOM = "UPDATE room SET "
                + "`maxOccupancy` = ?, `building` = ?, `floorNum` = ?, `interior` = ?, "
                + "`imageLink = ?, `available` = ?, "
                + "`featured` = ? WHERE `roomID` = ?";
        jdbc.update(UPDATE_ROOM, room.getRoomNum(), room.getBuilding(), room.getFloorNum(), 
                room.getImageLink(), room.isAvailable(), room.isFeatured(), room.getRoomID());
    }

    @Override
    public void removeRoom(Room room) {
        final String DELETE_VEHICLE = "DELETE FROM `room` WHERE `roomID` = ?";
        jdbc.update(DELETE_VEHICLE, room.getRoomID());
    }
    
    @Override
    public List<Room> getRoomsByQuery(String search, int[] params) {
        final String SEARCH = String.format("SELECT * FROM `vehicle` WHERE "
                + "`year` LIKE %s OR `make` LIKE %s OR `model` LIKE %s",
                search, search, search);
        return jdbc.query(SEARCH, new RoomMapper());
    }

    @Override
    public void addBuilding(String name, int floors, int rooms) {
        final String ADD_MODEL = "INSERT INTO `building` (`name`, `floors`, `rooms`) VALUES (?,?,?)";
        jdbc.update(ADD_MODEL, name, floors, rooms);
    }

    @Override
    public List<RoomBuilding> getBuildings() {
        final String GET_BUILDINGS = "SELECT * FROM `model`";
        return jdbc.query(GET_BUILDINGS, new BuildingMapper());
    }

    @Override
    public void addOccupancy(int occupancy, User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    public static final class RoomMapper implements RowMapper<Room> {
        @Override
        public Room mapRow(ResultSet rs, int rowNum) throws SQLException {
            Room room = new Room();

            room.setRoomID(rs.getInt("roomID"));
            room.setMaxOccupancy(rs.getInt("maxOccupancy"));
            room.setRoomNum(rs.getInt("roomNum"));
            room.setBuilding(rs.getString("building"));
            room.setFloorNum(rs.getInt("floorNum"));
            room.setImageLink(rs.getString("imageLink"));
            room.setAvailable(rs.getBoolean("available"));
            room.setFeatured(rs.getBoolean("featured"));

            return room;
        }
    }
    
    private static final class BuildingMapper implements RowMapper<RoomBuilding> {

        @Override
        public RoomBuilding mapRow(ResultSet rs, int rowNum) throws SQLException {
            RoomBuilding building = new RoomBuilding();
            building.setName(rs.getString("name"));
            building.setFloors(rs.getInt("floors"));
            building.setRooms(rs.getInt("rooms"));
            building.setDateAdded(rs.getTimestamp("dateAdded").toLocalDateTime());
            
            return building;
        }
    }
}