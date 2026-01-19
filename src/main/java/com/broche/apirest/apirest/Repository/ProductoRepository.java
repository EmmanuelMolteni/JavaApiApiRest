package com.broche.apirest.apirest.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.broche.apirest.apirest.Entities.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Long>{
    
}
