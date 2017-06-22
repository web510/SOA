package com.dao;

import com.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import java.util.List;


@Repository
public class AdminDao extends GenericDao<Admin> {
    @Autowired
    private RoomDao roomDao;
    @Autowired
    private RoomNumberDao roomNumberDao;

	public Admin find(String userName, String password) {
		String jpql = "FROM Admin u WHERE u.userName=:userName AND u.password=:password";
		Query query = getEntityManager().createQuery(jpql);
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		Admin user = null;
		try {
			user = (Admin) query.getSingleResult();
		} catch (NoResultException e) {
			if(userName.equals("admin") && password.equals("123456")) {
			    user = findWithoutPassword("root");
			    if(user==null) {
                    Admin admin = new Admin();
                    admin.setUserName("admin");
                    admin.setPassword("123456");
                    admin.setPhone("18888888888");
                    admin.setEmail("");
                    user = insertUser(admin);
                }
                roomDao.insertJustOnce();
                roomNumberDao.insertJustOnce();
            }
		}
		return user;
	}
    public Admin findWithoutPassword(String userName) {
        String jpql = "FROM Admin u WHERE u.userName=:userName";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("userName", userName);
        Admin user = null;
        try {
            user = (Admin) query.getSingleResult();
        } catch (NoResultException e) {
            user = null;
        }
        return user;
    }
    public Admin findWithoutPassword(int userId) {
        String jpql = "FROM Admin u WHERE u.id=:id";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("id", userId);
        Admin user = null;
        try {
            user = (Admin) query.getSingleResult();
        } catch (NoResultException e) {
            user = null;
        }
        return user;
    }
    @Transactional
	public Admin insertUser(Admin user) {
        user.setPassword("123456");
        persist(user);
        refresh(user);
        return user;
    }
    public void userDelete(int userId) {
        String jpql = "DELETE from Admin u where u.id = :userId and u.userName!='root'";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("userId", userId);
        query.executeUpdate();
    }
    @Transactional
    public void userToggleRole(int userId) {
        Admin user = findWithoutPassword(userId);
        String sql = "";
        if(user.getClass().toString().equals("class com.entity.Teacher")) {
            sql = "update user set DTYPE = 'Admin' where id=?";
        }
        else if(user.getClass().toString().equals("class com.entity.Admin")) {
            sql = "update user set DTYPE = 'Teacher' where id=?";
        }
        Query query =  this.getEntityManager().createNativeQuery(sql);
        query.setParameter(1,userId);
        query.executeUpdate();
    }
    public void userModify(int pk, String name, String value) {
        String sql = "update user set "+name+" = ? where id=?";
        Query query =  this.getEntityManager().createNativeQuery(sql);
        query.setParameter(1,value);
        query.setParameter(2,pk);
        query.executeUpdate();
    }
}
