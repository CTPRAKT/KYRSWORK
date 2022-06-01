package com.boots.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
    public class Reserv {
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name = "id", nullable = false)
        private Long id;

        private String name;

        private String author;

        private String usrname;

    public String getUser() {
        return usrname;
    }

    public void setUser(String user) {
        this.usrname = usrname;
    }

    public Reserv() {
    }

    public Reserv(String name, String author, String usrname) {
        this.name = name;
        this.author = author;
        this.usrname = usrname;
    }

    public Reserv(String name, String author) {
        this.name = name;
        this.author = author;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}


