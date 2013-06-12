package org.rti.zcore.dar.gen;

import org.rti.zcore.dar.gen.*;
import org.rti.zcore.EncounterData;
import org.rti.zcore.Patient;
import java.sql.Date;
import java.util.Set;
import java.sql.Time;
import java.sql.Timestamp;
import org.rti.zcore.AuditInfo;
import java.util.TreeSet;

/**
 * JavaBean PatientRegistration generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2013-04-16
 *         Time: 10:20:20
 *         Form Name: Patient Registration and Identification
 *         Form Id: 1
 */

/**
 * @hibernate.joined-subclass table="patientregistration"
 * @hibernate.joined-subclass-key column="id"
 */
public class PatientRegistration extends org.rti.zcore.PatientRegistration {

private String surname;	//surname field6
private String forenames;	//forenames field7
private Integer sex;	//sex field490
private String district_pat_13;	//district_pat_13 field13
private String patient_id_number;	//patient_id_number field1513
private Date birth_date;	//birth_date field17
private Integer age_at_first_attendence;	//age_at_first_attendence field1135
private Integer age_category;	//age_category field2279
private String street_address_1;	//street_address_1 field2280
private String street_address_2;	//street_address_2 field2281
private String mobile_phone;	//mobile_phone field2282
private Integer entry_point;	//entry_point field2286
private String entry_point_other;	//entry_point_other field2287
private String notes;	//notes field2291


 /**
  * @return
  * @hibernate.property column="surname"
  */
    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }





 /**
  * @return
  * @hibernate.property column="forenames"
  */
    public String getForenames() {
        return this.forenames;
    }

    public void setForenames(String forenames) {
        this.forenames = forenames;
    }





 /**
  * @return
  * @hibernate.property column="sex"
  */
    public Integer getSex() {
        return this.sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }





 /**
  * @return
  * @hibernate.property column="district_pat_13"
  */
    public String getDistrict_pat_13() {
        return this.district_pat_13;
    }

    public void setDistrict_pat_13(String district_pat_13) {
        this.district_pat_13 = district_pat_13;
    }





 /**
  * @return
  * @hibernate.property column="patient_id_number"
  */
    public String getPatient_id_number() {
        return this.patient_id_number;
    }

    public void setPatient_id_number(String patient_id_number) {
        this.patient_id_number = patient_id_number;
    }





 /**
  * @return
  * @hibernate.property column="birth_date"
  */
    public Date getBirth_date() {
        return this.birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }





 /**
  * @return
  * @hibernate.property column="age_at_first_attendence"
  */
    public Integer getAge_at_first_attendence() {
        return this.age_at_first_attendence;
    }

    public void setAge_at_first_attendence(Integer age_at_first_attendence) {
        this.age_at_first_attendence = age_at_first_attendence;
    }





 /**
  * @return
  * @hibernate.property column="age_category"
  */
    public Integer getAge_category() {
        return this.age_category;
    }

    public void setAge_category(Integer age_category) {
        this.age_category = age_category;
    }





 /**
  * @return
  * @hibernate.property column="street_address_1"
  */
    public String getStreet_address_1() {
        return this.street_address_1;
    }

    public void setStreet_address_1(String street_address_1) {
        this.street_address_1 = street_address_1;
    }





 /**
  * @return
  * @hibernate.property column="street_address_2"
  */
    public String getStreet_address_2() {
        return this.street_address_2;
    }

    public void setStreet_address_2(String street_address_2) {
        this.street_address_2 = street_address_2;
    }





 /**
  * @return
  * @hibernate.property column="mobile_phone"
  */
    public String getMobile_phone() {
        return this.mobile_phone;
    }

    public void setMobile_phone(String mobile_phone) {
        this.mobile_phone = mobile_phone;
    }





 /**
  * @return
  * @hibernate.property column="entry_point"
  */
    public Integer getEntry_point() {
        return this.entry_point;
    }

    public void setEntry_point(Integer entry_point) {
        this.entry_point = entry_point;
    }





 /**
  * @return
  * @hibernate.property column="entry_point_other"
  */
    public String getEntry_point_other() {
        return this.entry_point_other;
    }

    public void setEntry_point_other(String entry_point_other) {
        this.entry_point_other = entry_point_other;
    }





 /**
  * @return
  * @hibernate.property column="notes" type="text"
  */
    public String getNotes() {
        return this.notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }





}
