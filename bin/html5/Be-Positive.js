BloodType = {
  AB_POS : "AB_POS",
  AB_NEG : "AB_NEG",
  A_POS  : "A_POS",
  A_NEG  : "A_NEG",
  B_POS  : "B_POS",
  B_NEG  : "B_NEG",
  O_POS  : "O_POS",
  O_NEG  : "O_NEG"
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

  receive_patient : function (blood_inventory, patient) {
    
    console.log(blood_inventory);

    return BloodType.B_POS;

  }

};