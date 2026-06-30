package com.mits.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mits.model.Employee;
import com.mits.repository.Employee_repository;
@Service
public class Employee_Service {
	@Autowired
private Employee_repository repo;
	
	
	public Employee saveEmploee(Employee employee) {
		return repo.save(employee);
	}


	public boolean existsByEmailAndPassword(String email, String password) {
	boolean status=repo.existsByEmailAndPassword(email, password);
	if(status)
		return true;
		return false;
	}


	public List<Employee> findAll() {
		return repo.findAll();
	}


	public Optional<Employee> findById(int id) {
		return repo.findById(id);
	}


	public Employee findByEmail(String email) {
		return repo.findByEmail(email);
	}


	public Employee updateEmployee(Employee employee) {
		    return repo.save(employee);
		
	}


	public void deleteEmployee(int id) {
		repo.deleteById(id);
	}


	
}
