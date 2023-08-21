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
@Table(name = "Products")
@Data
public class Products implements Serializable {
    @Id
    @Column(name = "product_id", length = 30)
    private String productId;

    @ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "category_id")
    private Categories categoryID;

    @Column(name = "product_name", nullable = false, length = 100)
    private String productName;

    @Column(name = "price", nullable = false)
    private Long price;

    @Column(length = 300)
    private String img1;

    @Column(length = 300)
    private String img2;

    @Column(length = 300)
    private String img3;

    @Column(name = "descmaterial", length = 300)
    private String descMaterial;

    @Column(name = "descsize", length = 300)
    private String descSize;

    @Column(name = "descpattern", length = 300)
    private String descPattern; 

    @OneToMany (mappedBy = "productID")
    private List<ProductsDetails> ProductsDetails;

    // Constructors, getters, setters
}

