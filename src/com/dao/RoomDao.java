package com.dao;

import com.entity.Room;
import com.entity.RoomNumber;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;


@Repository
public class RoomDao extends GenericDao<Room> {
	@Transactional
	public void insertJustOnce() {
		Room room;
        room = new Room();
		room.setType("总统套房");
		room.setCount(2);
        persist(room);
        Room room2 = new Room();
		room2.setType("标准间");
		room2.setCount(10);
		persist(room2);
		Room room3 = new Room();
		room3.setType("大床房");
		room3.setCount(8);
		persist(room3);
    }
    @Transactional
    public Room find(String type){
        String jpql = "FROM Room u WHERE u.type=:type";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("type", type);
        Room room = null;
        room = (Room) query.getSingleResult();
//        try {
//            room = (Room) query.getSingleResult();
//        } catch (NoResultException e) {
//            room = null;
//        }
        return room;
    }
}
