import com.haxepunk.Entity;
import com.haxepunk.HXP;
class Donor extends Person
{
  public static inline var IDLE:String          = "IDLE";
  public static inline var YAY:String           = "YAY";
  public static inline var GFX_IDLE:Int         = 0;
  public static inline var GFX_YAY:Int          = 1;
  public static inline var DONATION_TIME:Int    = 10000; // ms

  public function new(main:MainScene){
    super(main);

    sprite.add(IDLE, toGenderGFX([GFX_IDLE]) );
    sprite.add(YAY, toGenderGFX([GFX_YAY]) );
    sprite.play(IDLE);

    addGraphic(sprite);

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

      haxe.Timer.delay( donation_complete, DONATION_TIME );
    }

    // moved off screen, remove self
    else
    {

      main.remove(this);
      main.donors.remove(this);

    }


    destination = null;
  }

  /*
    leave clinic to the right
  */
  private inline function donation_complete():Void
  {
    this.visible = true;
    
    destination = { x : MainScene.SCREEN_WIDTH, y : Std.random(MainScene.SCREEN_HEIGHT) };

  }
}