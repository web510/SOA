package com.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(unique = true, nullable = false)
    private String type;
    @Column(updatable = false)
    private int count;
    @OneToMany(mappedBy = "room")
    private Set<Order_> orders;
    @OneToMany(mappedBy = "room")
    private Set<RoomNumber> roomNumbers;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Set<Order_> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order_> orders) {
        this.orders = orders;
    }
}
