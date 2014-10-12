import com.haxepunk.Entity;
class Clinic extends Entity
{
  public static inline var X:Int = 450;
  public static inline var Y:Int = 200;
  public static inline var DOOR_X:Int = 470;
  public static inline var DOOR_Y:Int = 230;

  private static inline var GFX_PATH:String = "graphics/clinic.png";

  public function new(){

    super( X, Y, new com.haxepunk.graphics.Image(GFX_PATH) );
  }
}