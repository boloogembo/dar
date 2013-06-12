package org.rti.zcore.dar.gen.openmrs;

import org.rti.zcore.openmrs.OpenMRSEncounter;
import org.rti.zcore.openmrs.OpenMrsMultiValue;
import org.rti.zcore.openmrs.OpenMrsValue;

/**
 * JavaBean PatientStatus_changes generated from database;
 * generated by DynasiteSourceGenerator, inspired by XslBeanGenerator by Klaus Berg.
 *
 * @author Chris Kelley
 *         Date: 2012-09-14
 *         Time: 11:43:50
 *         Form Name: Patient Status
 *         Form Id: 180
 */

/**
 * @hibernate.joined-subclass table="patient_status_changes"
 * @hibernate.joined-subclass-key column="id"
 */
public class PatientStatus_changes extends OpenMRSEncounter {

private OpenMrsValue type_of_change;	//type_of_change field201
private OpenMrsValue comments;	//comments field202


 /**
  * @return
  * @hibernate.property column="type_of_change"
  */
    public OpenMrsValue getType_of_change() {
        return this.type_of_change;
    }

    public void setType_of_change(OpenMrsValue type_of_change) {
        this.type_of_change = type_of_change;
    }





 /**
  * @return
  * @hibernate.property column="comments"
  */
    public OpenMrsValue getComments() {
        return this.comments;
    }

    public void setComments(OpenMrsValue comments) {
        this.comments = comments;
    }





}
