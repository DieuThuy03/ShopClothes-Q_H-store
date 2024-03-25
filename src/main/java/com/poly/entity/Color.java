package com.poly.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "Color")
public class Color {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer Color_id;
    String name;
    String Detail;
    @JsonIgnore
    @OneToMany(mappedBy = "color")
    List<Product> Products;
}
