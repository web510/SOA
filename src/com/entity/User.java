package com.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(unique = true, nullable = false, length = 30)
	private String userName;
    @Column(nullable = false, length = 40)
	private String password;
    @Column(length = 20)
	private String phone;//电话号码
	private String sfzh;
	private String realName;
	@OneToMany(mappedBy = "user")
	private Set<Order_> order;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<Order_> getOrder() {
		return order;
	}

	public void setOrder(Set<Order_> order) {
		this.order = order;
	}
}
