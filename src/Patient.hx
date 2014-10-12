import com.haxepunk.Entity;
import com.haxepunk.HXP;
class Patient extends Person
{
  public static inline var SICK_BEFORE:String      = "SICK_BEFORE";
  public static inline var HEALTHY_AFTER:String    = "HEALTHY_AFTER";
  public static inline var SICK_AFTER:String       = "SICK_AFTER";
  public static inline var DEAD:String             = "DEAD";
  public static inline var GFX_SICK_BEFORE:Int     = 2;
  public static inline var GFX_HEALTHY_AFTER:Int   = 3;
  public static inline var GFX_SICK_AFTER:Int      = 4;
  public static inline var GFX_DEAD:Int            = 5;
  public static inline var TRANSFUSION_TIME:Int    = 6000; // ms

  private var recently_got_blood:Bool; // if true, JUST left hospital

  public function new(main:MainScene){
    super(main);
    
    sprite.add(SICK_BEFORE, toGenderGFX([GFX_SICK_BEFORE]) );
    sprite.add(HEALTHY_AFTER, toGenderGFX([GFX_HEALTHY_AFTER]) );
    sprite.add(SICK_AFTER, toGenderGFX([GFX_SICK_AFTER]) );
    sprite.add(DEAD, toGenderGFX([GFX_DEAD]) );
    sprite.play(SICK_BEFORE);
    
    addGraphic(sprite);


    // when born, go to the clinic
    destination = { x : Clinic.DOOR_X, y : Clinic.DOOR_Y };
  }

  // private override function sprite_loaded():Void
  // {
  // }

  private override function arrive():Void
  {
    // if clinic, go in clinic
    if( destination.x == Clinic.DOOR_X && destination.y == Clinic.DOOR_Y ){
      // ARRIVED TO CLINIC
      // don't show for a while
      this.visible = false;

      haxe.Timer.delay( transfusion_complete, TRANSFUSION_TIME );
    }

    // go outside, hang out, then resolve blood
    else if(recently_got_blood)
    {



    }

    // 
    else{



    }


    destination = null;
  }

  /*
    runs after "transfusion" delay, inside of clinic
    leave clinic slowly to random spot outside
      wait seconds
    transition to resolved state
  */
  private inline function transfusion_complete():Void
  {
    this.visible = true;
    this.recently_got_blood = false;

    // go to random spot outside
    this.destination = {
      x : Std.random(MainScene.SCREEN_WIDTH) * .75,
      y : Std.random(MainScene.SCREEN_HEIGHT) * .75
    };
  }


}