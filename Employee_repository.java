package com.mits.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mits.model.Employee;
@Repository
public interface Employee_repository extends JpaRepository<Employee, Integer> {
public boolean existsByEmailAndPassword(String email,String password);
public Employee findByEmail(String email);
}
