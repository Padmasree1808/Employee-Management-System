package com.mits.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.mits.service.Employee_Service;

import jakarta.servlet.http.HttpSession;

import com.mits.model.Employee;

@Controller
public class Employee_Controller {
	@Autowired
private	Employee_Service service;
	
	
@RequestMapping("/")
public String indexPage() {
	return "index";
	
}
@RequestMapping("/index")
public String homepage() {
	return "redirect:/";
}


@RequestMapping("/register")
public String register(){
	return "register";
}


@RequestMapping("/save")
public ModelAndView saveEmployee(@ModelAttribute Employee employee) {
	Employee e1=service.saveEmploee(employee);
	ModelAndView mav= new ModelAndView("login");
	mav.addObject("validate","Employee Registered successfully...");
	return mav;
}


@RequestMapping("/emplogin")
public ModelAndView empLogin(@RequestParam String email,
                             @RequestParam String password) {

    ModelAndView mav;
    if(email.equals("admin@gmail.com") && password.equals("admin")) {
        return new ModelAndView("admin");
    }
    boolean status = service.existsByEmailAndPassword(email, password);
    if(status) {
        Employee employee = service.findByEmail(email);
        mav = new ModelAndView("employee");
        mav.addObject("msg",
                "Hi " + employee.getName() + ", Welcome to Login Page");
        mav.addObject("email", employee.getEmail());
    } else {
        mav = new ModelAndView("login");
        mav.addObject("validate", "Invalid Credentials");
    }
    return mav;
}




@RequestMapping("/login")
public String loginPage() {
    return "login";
}



@RequestMapping("/admin")
	public String home() {
		return "redirect:/";
	}



@RequestMapping("/emplogout")
public String emplogout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
}



@RequestMapping("/findByEmail")
public ModelAndView findByEmail(HttpSession session) {
    String email = (String) session.getAttribute("email");
    Employee employee = service.findByEmail(email);
    ModelAndView mav = new ModelAndView("viewprofile");
    mav.addObject("employee", employee);
    return mav;
}




@RequestMapping("/aboutus")
public String aboutus() {
    return "aboutus";
}



@RequestMapping("/contactus")
public ModelAndView contactus() {
	return new ModelAndView ("contactus");
}



@RequestMapping("/findAll")
public ModelAndView findAll() {
    List<Employee> employees = service.findAll();
    ModelAndView mav = new ModelAndView("viewemps");
    mav.addObject("empList", employees);
    return mav;
}



@RequestMapping("/search")
public String searchByEmail() {
	return "search";
}



@RequestMapping("/find")
public ModelAndView findemp(@RequestParam String email) {
	Employee employee = service.findByEmail(email);
    ModelAndView mav = new ModelAndView("viewemp");
    mav.addObject("employee", employee);

    return mav;
}



    @RequestMapping("/employee")
    public ModelAndView home(HttpSession session) {
        String email = (String) session.getAttribute("email");
        ModelAndView mav = new ModelAndView("employee");
        mav.addObject("email", email);
        return mav;
    }
    
    
    
    
    @RequestMapping("/view")
    public ModelAndView view(@RequestParam String email) {

        Employee employee = service.findByEmail(email);

        ModelAndView mav = new ModelAndView("viewprofile");
        mav.addObject("employee", employee);

        return mav;
    }
    
    
    
    @RequestMapping("/edit")
    public String edit() {
        return "edit";
    }
    
    
    
    @RequestMapping("/edituser")
    public ModelAndView editUser(Employee employee) {
        service.updateEmployee(employee);
        ModelAndView mav = new ModelAndView("admin");
        mav.addObject("status", "Employee Updated Successfully");
        mav.addObject("email",
                "Hi " + employee.getName() );
        return mav;
    }
    
    
    
    
    @RequestMapping("/delete")
    public ModelAndView delete(@RequestParam int id) {
        service.deleteEmployee(id);
        ModelAndView mav = new ModelAndView("admin");
        mav.addObject("status", "Employee Deleted Successfully");
        return mav;
    }

    
}


