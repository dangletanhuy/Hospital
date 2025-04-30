package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
    private Connection conn;

    public DoctorDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean RegisterDoctor (Doctor d){
        boolean f = false;
        try {
            String sql = "insert into doctor_detail(fullname,email,password,dob,quali,specialist,phoneno) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getFullName());
            ps.setString(2, d.getEmail());
            ps.setString(3, d.getPassword());
            ps.setString(4, d.getDob());
            ps.setString(5, d.getQuali());
            ps.setString(6, d.getSpecialist());
            ps.setString(7, d.getPhoneNo());

            int i=ps.executeUpdate();
            if(i==1){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Doctor> getAllDoctor(){
        List<Doctor> list = new ArrayList<Doctor>();
        Doctor d = null;
        try {
            String sql = "select * from doctor_detail order by id desc";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("fullname"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));
                d.setDob(rs.getString("dob"));
                d.setQuali(rs.getString("quali"));
                d.setSpecialist(rs.getString("specialist"));
                d.setPhoneNo(rs.getString("phoneno"));
                list.add(d);
            }
                
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Doctor getDoctorById(int id){
        Doctor d = null;
        try {
            String sql = "select * from doctor_detail where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setFullName(rs.getString("fullname"));
                d.setEmail(rs.getString("email"));
                d.setPassword(rs.getString("password"));
                d.setDob(rs.getString("dob"));
                d.setQuali(rs.getString("quali"));
                d.setSpecialist(rs.getString("specialist"));
                d.setPhoneNo(rs.getString("phoneno"));
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }
    
    public boolean updateDoctor (Doctor d){
        boolean f = false;
        try {
            String sql = "update doctor_detail set fullname=?,email=?,password=?,dob=?,quali=?,specialist=?,phoneno=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getFullName());
            ps.setString(2, d.getEmail());
            ps.setString(3, d.getPassword());
            ps.setString(4, d.getDob());
            ps.setString(5, d.getQuali());
            ps.setString(6, d.getSpecialist());
            ps.setString(7, d.getPhoneNo());
            ps.setInt(8, d.getId());

            int i=ps.executeUpdate();

            if(i==1){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteDoctor(int id) {
        boolean f = false;
        try {
            String sql = "delete from doctor_detail where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if(i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
