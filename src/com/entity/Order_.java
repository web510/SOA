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
    private String name;//姓名
    private String sfzh;//身份证号
    private String phone;//电话号码
    private Date inDate;//入住时间
    @Column(nullable = false)
    private String status;//order状态: 已预订、已缴费、已入住、已退房
    @ManyToOne
    private Room room;//预定的房间号
    private int roomNumberId;

    public int getRoomNumberId() {
        return roomNumberId;
    }

    public void setRoomNumberId(int roomNumberId) {
        this.roomNumberId = roomNumberId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        if(status.equals("已预订") || status.equals("已缴费")|| status.equals("已入住")|| status.equals("已退房"))
            this.status = status;
        else throw new PostException("系统错误，状态不正确");
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSfzh() {
        return sfzh;
    }

    public void setSfzh(String sfzh) {
        this.sfzh = sfzh;
    }

    public Date getInDate() {
        return inDate;
    }

    public void setInDate(Date inDate) {
        this.inDate = inDate;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
