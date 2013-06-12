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
 * JavaBean UserInfo generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:47
 *         Form Name: User Data
 *         Form Id: 170
 */

/**
 * @hibernate.joined-subclass table="user_info"
 * @hibernate.joined-subclass-key column="id"
 */
public class UserInfo extends EncounterData {

private String username;	//username field2266
private String password;	//password field2267
private String email;	//email field2270
private String forenames;	//forenames field2268
private String lastname;	//lastname field2269
private String mobile;	//mobile field2271
private String phone;	//phone field2272


 /**
  * @return
  * @hibernate.property column="username"
  */
    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }





 /**
  * @return
  * @hibernate.property column="password"
  */
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }





 /**
  * @return
  * @hibernate.property column="email"
  */
    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
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
  * @hibernate.property column="lastname"
  */
    public String getLastname() {
        return this.lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }





 /**
  * @return
  * @hibernate.property column="mobile"
  */
    public String getMobile() {
        return this.mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }





 /**
  * @return
  * @hibernate.property column="phone"
  */
    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }





}
