BloodType = {
  AB_POS : "BloodType.AB_POS",
  AB_NEG : "BloodType.AB_NEG",
  A_POS  : "BloodType.A_POS",
  A_NEG  : "BloodType.A_NEG",
  B_POS  : "BloodType.B_POS",
  B_NEG  : "BloodType.B_NEG",
  O_POS  : "BloodType.O_POS",
  O_NEG  : "BloodType.O_NEG"
};

BloodTransfusionRules = {
  
  simulation_speed : 90,

/**
 * returns BloodType, or false to give no BloodType
 * 
 * @name receive_patient
 * @param {Patient} patient
 * @returns {BloodType or false}
 * 
 */

  receive_patient : function (patient) {
    
    console.log(patient);

    return BloodType.B_POS;

  }

};