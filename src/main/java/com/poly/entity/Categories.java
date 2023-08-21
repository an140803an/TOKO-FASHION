package com.poly.entity;
import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Categories")
@Data
public class Categories implements Serializable {
    @Id
    @Column(name = "category_id", length = 30)
    private String categoryId;

    @Column(name = "category_type", length = 30)
    private String categoryType;
    
    @OneToMany(mappedBy = "categoryID")
    List<Products> products;

    // Constructors, getters, setters
}

