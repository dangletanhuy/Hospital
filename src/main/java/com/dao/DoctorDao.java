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

    public Doctor login(String email, String password) {
        Doctor d = null;

        try {
            String sql = "select * from doctor_detail where email=? and password=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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

    public int countDoctor() {
        int i = 0;
        try {
            String sql = "select * from doctor_detail";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }
    
    public int countAppointment() {
        int i = 0;
        try {
            String sql = "select * from appointment";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countAppointmentByDoctorId(int did) {
        int i = 0;
        try {
            String sql = "select * from appointment where doctor_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, did);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }
    
    public int countUser() {
        int i = 0;
        try {
            String sql = "select * from user_detail";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public int countSpecialist() {
        int i = 0;
        try {
            String sql = "select * from spe_detail";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public boolean checkOldPassword(int userId, String oldPassword){
        boolean f = false;
        
        try {
            String sql = "select * from doctor_detail where id=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean changePassword(int userId, String newPassword){
        boolean f = false;
        try {
            String sql = "update doctor_detail set password=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userId);

            int i = ps.executeUpdate();
            if(i == 1){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean editDoctorProfile (Doctor d){
        boolean f = false;
        try {
            String sql = "update doctor_detail set fullname=?,dob=?,quali=?,specialist=?,phoneno=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, d.getFullName());
            ps.setString(2, d.getDob());
            ps.setString(3, d.getQuali());
            ps.setString(4, d.getSpecialist());
            ps.setString(5, d.getPhoneNo());
            ps.setInt(6, d.getId());

            int i=ps.executeUpdate();

            if(i==1){
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Doctor> searchDoctorByName(String name) {
        List<Doctor> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM doctor_detail WHERE fullname LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
    
            while (rs.next()) {
                Doctor d = new Doctor();
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

}
