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
  NULL;
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
      case BloodType.NULL:    "none";
    }
  }

  /*
    [1,1,1,1,1,1,1,1]
    [1,0,1,0,1,0,1,0]
    [1,1,0,0,1,1,0,0]
    [1,0,0,0,1,0,0,0]
    [1,1,1,1,0,0,0,0]
    [1,0,1,0,0,0,0,0]
    [1,1,0,0,0,0,0,0]
    [1,0,0,0,0,0,0,0]
   */
  public static var blood_map(get_blood_map, null):Map<BloodType,Map<BloodType,Bool>>;
  private static var map:Map<BloodType,Map<BloodType,Bool>>;
  private static inline function get_blood_map():Map<BloodType,Map<BloodType,Bool>>
  {
    if(map == null){
      map = new Map<BloodType,Map<BloodType,Bool>>();

      map[BloodType.AB_POS] = new Map<BloodType,Bool>();
      map[BloodType.AB_NEG] = new Map<BloodType,Bool>();
      map[BloodType.A_POS]  = new Map<BloodType,Bool>();
      map[BloodType.A_NEG]  = new Map<BloodType,Bool>();
      map[BloodType.B_POS]  = new Map<BloodType,Bool>();
      map[BloodType.B_NEG]  = new Map<BloodType,Bool>();
      map[BloodType.O_POS]  = new Map<BloodType,Bool>();
      map[BloodType.O_NEG]  = new Map<BloodType,Bool>();

      map[BloodType.AB_POS][BloodType.AB_POS] = true;
      map[BloodType.AB_POS][BloodType.AB_NEG] = true;
      map[BloodType.AB_POS][BloodType.A_POS]  = true;
      map[BloodType.AB_POS][BloodType.A_NEG]  = true;
      map[BloodType.AB_POS][BloodType.B_POS]  = true;
      map[BloodType.AB_POS][BloodType.B_NEG]  = true;
      map[BloodType.AB_POS][BloodType.O_POS]  = true;
      map[BloodType.AB_POS][BloodType.O_NEG]  = true;

      map[BloodType.AB_NEG][BloodType.AB_POS] = false;
      map[BloodType.AB_NEG][BloodType.AB_NEG] = true;
      map[BloodType.AB_NEG][BloodType.A_POS]  = false;
      map[BloodType.AB_NEG][BloodType.A_NEG]  = true;
      map[BloodType.AB_NEG][BloodType.B_POS]  = false;
      map[BloodType.AB_NEG][BloodType.B_NEG]  = true;
      map[BloodType.AB_NEG][BloodType.O_POS]  = false;
      map[BloodType.AB_NEG][BloodType.O_NEG]  = true;

      map[BloodType.A_POS][BloodType.AB_POS] = false;
      map[BloodType.A_POS][BloodType.AB_NEG] = false;
      map[BloodType.A_POS][BloodType.A_POS]  = true;
      map[BloodType.A_POS][BloodType.A_NEG]  = true;
      map[BloodType.A_POS][BloodType.B_POS]  = false;
      map[BloodType.A_POS][BloodType.B_NEG]  = false;
      map[BloodType.A_POS][BloodType.O_POS]  = true;
      map[BloodType.A_POS][BloodType.O_NEG]  = true;

      map[BloodType.A_NEG][BloodType.AB_POS] = false;
      map[BloodType.A_NEG][BloodType.AB_NEG] = false;
      map[BloodType.A_NEG][BloodType.A_POS]  = false;
      map[BloodType.A_NEG][BloodType.A_NEG]  = true;
      map[BloodType.A_NEG][BloodType.B_POS]  = false;
      map[BloodType.A_NEG][BloodType.B_NEG]  = false;
      map[BloodType.A_NEG][BloodType.O_POS]  = false;
      map[BloodType.A_NEG][BloodType.O_NEG]  = true;

      map[BloodType.B_POS][BloodType.AB_POS] = false;
      map[BloodType.B_POS][BloodType.AB_NEG] = false;
      map[BloodType.B_POS][BloodType.A_POS]  = false;
      map[BloodType.B_POS][BloodType.A_NEG]  = false;
      map[BloodType.B_POS][BloodType.B_POS]  = true;
      map[BloodType.B_POS][BloodType.B_NEG]  = true;
      map[BloodType.B_POS][BloodType.O_POS]  = true;
      map[BloodType.B_POS][BloodType.O_NEG]  = true;

      map[BloodType.B_NEG][BloodType.AB_POS] = false;
      map[BloodType.B_NEG][BloodType.AB_NEG] = false;
      map[BloodType.B_NEG][BloodType.A_POS]  = false;
      map[BloodType.B_NEG][BloodType.A_NEG]  = false;
      map[BloodType.B_NEG][BloodType.B_POS]  = false;
      map[BloodType.B_NEG][BloodType.B_NEG]  = true;
      map[BloodType.B_NEG][BloodType.O_POS]  = false;
      map[BloodType.B_NEG][BloodType.O_NEG]  = true;

      map[BloodType.O_POS][BloodType.AB_POS] = false;
      map[BloodType.O_POS][BloodType.AB_NEG] = false;
      map[BloodType.O_POS][BloodType.A_POS]  = false;
      map[BloodType.O_POS][BloodType.A_NEG]  = false;
      map[BloodType.O_POS][BloodType.B_POS]  = false;
      map[BloodType.O_POS][BloodType.B_NEG]  = false;
      map[BloodType.O_POS][BloodType.O_POS]  = true;
      map[BloodType.O_POS][BloodType.O_NEG]  = true;

      map[BloodType.O_NEG][BloodType.AB_POS] = false;
      map[BloodType.O_NEG][BloodType.AB_NEG] = false;
      map[BloodType.O_NEG][BloodType.A_POS]  = false;
      map[BloodType.O_NEG][BloodType.A_NEG]  = false;
      map[BloodType.O_NEG][BloodType.B_POS]  = false;
      map[BloodType.O_NEG][BloodType.B_NEG]  = false;
      map[BloodType.O_NEG][BloodType.O_POS]  = false;
      map[BloodType.O_NEG][BloodType.O_NEG]  = true;
    }
    return map;
  }
}
