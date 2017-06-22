package com.dao;

import com.entity.User;
import com.exception.PostException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.persistence.Query;


@Repository
public class UserDao extends GenericDao<User> {
    @Autowired
    private RoomDao roomDao;
    @Autowired
    private RoomNumberDao roomNumberDao;

	public User find(String userName, String password) {
		String jpql = "FROM User u WHERE u.userName=:userName AND u.password=:password";
		Query query = getEntityManager().createQuery(jpql);
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		User user = null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException e) {
			throw new PostException("用户名或密码错误");
		}
		return user;
	}
    public User findWithoutPassword(String userName) {
        String jpql = "FROM User u WHERE u.userName=:userName";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("userName", userName);
        User user = null;
        try {
            user = (User) query.getSingleResult();
        } catch (NoResultException e) {
            user = null;
        }
        return user;
    }
    public User findWithoutPassword(int userId) {
        String jpql = "FROM User u WHERE u.id=:id";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("id", userId);
        User user = null;
        try {
            user = (User) query.getSingleResult();
        } catch (NoResultException e) {
            user = null;
        }
        return user;
    }
    @Transactional
	public User insertUser(User user) {
        persist(user);
        refresh(user);
        return user;
    }
    public void userDelete(int userId) {
        String jpql = "DELETE from User u where u.id = :userId and u.userName!='root'";
        Query query = getEntityManager().createQuery(jpql);
        query.setParameter("userId", userId);
        query.executeUpdate();
    }
    @Transactional
    public void userToggleRole(int userId) {
        User user = findWithoutPassword(userId);
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
