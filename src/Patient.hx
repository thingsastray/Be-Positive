import com.haxepunk.Entity;
import com.haxepunk.HXP;
class Patient extends Person
{
  public static inline var SICK_BEFORE:String     = "SICK_BEFORE";
  public static inline var HEALTHY_AFTER:String   = "HEALTHY_AFTER";
  public static inline var SICK_AFTER:String      = "SICK_AFTER";
  public static inline var DEAD:String            = "DEAD";
  public static inline var GFX_SICK_BEFORE:Int    = 2;
  public static inline var GFX_HEALTHY_AFTER:Int  = 3;
  public static inline var GFX_SICK_AFTER:Int     = 4;
  public static inline var GFX_DEAD:Int           = 5;

  public function new(main:MainScene){
    super(main);
    trace("spawned patient");

    sprite.add(SICK_BEFORE, toGenderGFX([GFX_SICK_BEFORE]) );
    sprite.add(HEALTHY_AFTER, toGenderGFX([GFX_HEALTHY_AFTER]) );
    sprite.add(SICK_AFTER, toGenderGFX([GFX_SICK_AFTER]) );
    sprite.add(DEAD, toGenderGFX([GFX_DEAD]) );
    
    addGraphic(sprite);


    // when born, go to the clinic
    destination = { x : Clinic.DOOR_X, y : Clinic.DOOR_Y };
  }

  private override function sprite_loaded():Void
  {
    sprite.play(SICK_BEFORE);
  }
}