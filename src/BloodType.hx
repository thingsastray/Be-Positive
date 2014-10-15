enum BloodType
{
  AB_POS;
  AB_NEG;
  A_POS;
  A_NEG;
  B_POS;
  B_NEG;
  O_POS;
  O_NEG;
}

class BloodTypeTools
{

  // presentation
  // AB_POS => "ab+"
  public static inline function toLabel(blood_type: BloodType):String
  {
    return switch (blood_type) {
      case BloodType.AB_POS: "ab+";
      case BloodType.AB_NEG: "ab-";
      case BloodType.A_POS:   "a+";
      case BloodType.A_NEG:   "a-";
      case BloodType.B_POS:   "b+";
      case BloodType.B_NEG:   "b-";
      case BloodType.O_POS:   "o+";
      case BloodType.O_NEG:   "o-";
    }
  }
}