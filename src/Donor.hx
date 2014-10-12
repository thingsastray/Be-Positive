import com.haxepunk.Entity;
import com.haxepunk.HXP;
class Donor extends Person
{
  public static inline var IDLE:String  = "IDLE";
  public static inline var YAY:String   = "YAY";
  public static inline var GFX_IDLE:Int = 0;
  public static inline var GFX_YAY:Int  = 1;
  public function new(main:MainScene){
    super(main);
    trace("spawned donor");

    sprite.add(IDLE, toGenderGFX([GFX_IDLE]) );
    sprite.add(YAY, toGenderGFX([GFX_YAY]) );

    addGraphic(sprite);

    destination = { x : Clinic.DOOR_X, y : Clinic.DOOR_Y };
  }

  private override function sprite_loaded():Void
  {
    sprite.play(IDLE);
  }
}