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
  
  /**
   * Set the simulation speed.
   * @type {Number} : Valid values between 1 and 200
   */
  simulation_speed : 200,

  /**
   * returns BloodType, or false to give no BloodType
   * 
   * @name receive_patient
   * @param {Bank} blood_inventory
   * @param {Patient} patient
   * @returns {BloodType or false}
   *
   * Patient properties {
   *   gender : String, (MALE,FEMALE)
   *   blood_type : String (BloodType)
   * }
   * 
   * Bank properties {
   *   AB_POS : Integer,
   *   AB_NEG : Integer,
   *   A_POS  : Integer,
   *   A_NEG  : Integer,
   *   B_POS  : Integer,
   *   B_NEG  : Integer,
   *   O_POS  : Integer,
   *   O_NEG  : Integer
   * }
   * 
   */

  receive_patient : function (blood_inventory, patient) {
      var acceptableBlood = [];
      if (patient.blood_type === BloodType.AB_POS) {
        acceptableBlood = ["AB_POS", "AB_NEG", "A_POS", "A_NEG","B_POS", "B_NEG", "O_POS", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);            
      }

      if (patient.blood_type === BloodType.AB_NEG) {
        acceptableBlood = ["AB_NEG", "A_NEG", "B_NEG", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }

      if (patient.blood_type === BloodType.A_NEG) {
        acceptableBlood = ["A_NEG", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }

      if (patient.blood_type === BloodType.A_POS) {
        acceptableBlood = ["A_POS", "A_NEG", "O_POS", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }

      if (patient.blood_type === BloodType.B_POS) {
        acceptableBlood = ["B_POS", "B_NEG", "O_POS", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }

      if (patient.blood_type === BloodType.B_NEG){
        acceptableBlood = ["B_NEG", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }
      if (patient.blood_type === BloodType.O_NEG){
        acceptableBlood = ["O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood); 
      }

      if (patient.blood_type === BloodType.O_POS){
        acceptableBlood = ["O_POS", "O_NEG"];
        return searchBloodtype(blood_inventory, acceptableBlood);
      }
    }
};

function searchBloodtype (blood_inventory, acceptableBlood) {
    for (var i = 0; i < acceptableBlood.length; i++) {
    var bloodType = acceptableBlood[i];
    if (blood_inventory[bloodType] > 0){
      return BloodType[bloodType];
    }
  }
  return false; 
}