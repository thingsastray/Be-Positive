extern class BloodTransfusionRules
{
  public static var simulation_speed:Float;
  public static function receive_patient(patient:Person.PersonJSO):BloodType;
}