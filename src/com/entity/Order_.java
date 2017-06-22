package com.entity;

import com.exception.PostException;

import javax.persistence.*;
import java.sql.Date;
import java.util.Set;

@Entity
public class Order_ {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @ManyToOne
    private User user;
    private String type;//hotel car tour
    private int remoteOrderId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getRemoteOrderId() {
        return remoteOrderId;
    }

    public void setRemoteOrderId(int remoteOrderId) {
        this.remoteOrderId = remoteOrderId;
    }
}
