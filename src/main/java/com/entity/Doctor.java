package com.entity;

public class Doctor {
    private int id;
    private String fullName;
    private String email;
    private String password;
    private String dob;
    private String qualification;
    private String specialist;
    private String phoneNo;

    public Doctor() {
    }

    public Doctor(String fullName, String email, String password, String dob, String qualification, String specialist, String phoneNo) {      
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.qualification = qualification;
        this.specialist = specialist;
        this.phoneNo = phoneNo;
    }

    public Doctor(int id, String fullName, String email, String password, String dob, String qualification, String specialist, String phoneNo) {      
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.qualification = qualification;
        this.specialist = specialist;
        this.phoneNo = phoneNo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQuali() {
        return qualification;
    }

    public void setQuali(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
    
}
