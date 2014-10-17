import Clinic;
import Person;
extern class BloodTransfusionRules
{
  public static var simulation_speed:Float;
  public static function receive_patient(blood_inventory:Bank, patient:PersonJSO):String;
}