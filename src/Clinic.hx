import com.haxepunk.Entity;

typedef Bank = {
  var AB_POS:Int; // units
  var AB_NEG:Int;
  var A_POS:Int;
  var A_NEG:Int;
  var B_POS:Int;
  var B_NEG:Int;
  var O_POS:Int;
  var O_NEG:Int;
}

class Clinic extends Entity
{
  public static inline var X:Int = 450;
  public static inline var Y:Int = 200;
  public static inline var DOOR_X:Int = 470;
  public static inline var DOOR_Y:Int = 230;
  private static inline var DEFAULT_INITIAL_STOCK:Int = 5;

  private var bank:Bank;

  private static inline var GFX_PATH:String = "graphics/clinic.png";

  public function new(){

    bank = {
      AB_POS : DEFAULT_INITIAL_STOCK,
      AB_NEG : DEFAULT_INITIAL_STOCK,
      A_POS : DEFAULT_INITIAL_STOCK,
      A_NEG : DEFAULT_INITIAL_STOCK,
      B_POS : DEFAULT_INITIAL_STOCK,
      B_NEG : DEFAULT_INITIAL_STOCK,
      O_POS : DEFAULT_INITIAL_STOCK,
      O_NEG : DEFAULT_INITIAL_STOCK,
    };

    super( X, Y, new com.haxepunk.graphics.Image(GFX_PATH) );
  }
}