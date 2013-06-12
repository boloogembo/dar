package org.rti.zcore.dar.gen.openmrs;

import org.rti.zcore.openmrs.OpenMRSEncounter;
import org.rti.zcore.openmrs.OpenMrsMultiValue;
import org.rti.zcore.openmrs.OpenMrsValue;

/**
 * JavaBean ArtRegimen generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:50
 *         Form Name: ART Regimen
 *         Form Id: 137
 */

/**
 * @hibernate.joined-subclass table="art_regimen"
 * @hibernate.joined-subclass-key column="id"
 */
public class ArtRegimen extends OpenMRSEncounter {

private OpenMrsValue date_started;	//date_started field2171
private OpenMrsValue regimen_1;	//regimen_1 field2173
private OpenMrsValue regimen_change_reason;	//regimen_change_reason field2293


 /**
  * @return
  * @hibernate.property column="date_started"
  */
    public OpenMrsValue getDate_started() {
        return this.date_started;
    }

    public void setDate_started(OpenMrsValue date_started) {
        this.date_started = date_started;
    }





 /**
  * @return
  * @hibernate.property column="regimen_1"
  */
    public OpenMrsValue getRegimen_1() {
        return this.regimen_1;
    }

    public void setRegimen_1(OpenMrsValue regimen_1) {
        this.regimen_1 = regimen_1;
    }





 /**
  * @return
  * @hibernate.property column="regimen_change_reason"
  */
    public OpenMrsValue getRegimen_change_reason() {
        return this.regimen_change_reason;
    }

    public void setRegimen_change_reason(OpenMrsValue regimen_change_reason) {
        this.regimen_change_reason = regimen_change_reason;
    }





}
