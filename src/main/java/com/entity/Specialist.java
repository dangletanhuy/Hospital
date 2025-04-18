package com.entity;

public class Specialist {
    int id;
    String SpecialistName;
    
    public Specialist() {
    }        
    
    public Specialist(int id, String specialistName) {
        this.id = id;
        SpecialistName = specialistName;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getSpecialistName() {
        return SpecialistName;
    }
    public void setSpecialistName(String specialistName) {
        SpecialistName = specialistName;
    }



    
}
