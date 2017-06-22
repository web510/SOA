package com.dao;

import com.entity.Order_;
import com.entity.Room;
import com.entity.RoomNumber;
import com.exception.PostException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.sql.Date;
import java.util.List;


@Repository
public class RoomNumberDao extends GenericDao<RoomNumber> {
    @Autowired
    private RoomDao roomDao;
    @Autowired
    private OrderDao orderDao;

	@Transactional
	public void insertJustOnce() {
		Room room = roomDao.find("总统套房");
		for(int i=1;i<=room.getCount();i++) {
            RoomNumber roomNumber = new RoomNumber();
            roomNumber.setNumber("超级海景总统套房100"+i);
            roomNumber.setRoom(room);
            persist(roomNumber);
        }


		Room room2 = roomDao.find("标准间");
        for(int i=1;i<=room2.getCount();i++) {
            RoomNumber roomNumber = new RoomNumber();
            roomNumber.setNumber("101"+i);
            roomNumber.setRoom(room2);
            persist(roomNumber);
        }


		Room room3 = roomDao.find("大床房");
        for(int i=1;i<=room3.getCount();i++) {
            RoomNumber roomNumber = new RoomNumber();
            roomNumber.setNumber("102"+i);
            roomNumber.setRoom(room3);
            persist(roomNumber);
        }
    }
    @Transactional
    public RoomNumber find(String number) {
        String jpql = "FROM RoomNumber u WHERE u.number=:number";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("number", number);
        RoomNumber roomNumber = null;
        roomNumber = (RoomNumber) query.getSingleResult();
        return roomNumber;
    }

    public List<RoomNumber> roomNumberListCanSelect(int order_id) {
        Order_ order = orderDao.find(order_id);
        Room room = order.getRoom();
        String jpql = "FROM RoomNumber u WHERE u.room=:room";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("room", room);
        return query.getResultList();
    }
    public Order_ roomByWhichOrdered(int roomNumberId, Date inDate) {
        String jpql = "FROM Order_ u WHERE u.roomNumberId=:roomNumberId AND u.inDate=:inDate";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("roomNumberId", roomNumberId);
        query.setParameter("inDate", inDate);
        try{
            return (Order_)query.getSingleResult();
        } catch(NoResultException e) {
            return null;
        }
    }
}
