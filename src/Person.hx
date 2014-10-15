import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

enum Gender
{
  MALE;
  FEMALE;
}

class Person extends Entity
{
  public static inline var GFX_OFFSET:Int = 6; // how many frames away female equivalent sprites are
  public static inline var GFX_PATH:String = "graphics/persons_72x72.png";
  public static inline var DEFAULT_MOVESPEED:Float = 3.9; // 1.1 - 3.9

  private static inline var BLOOD_BADGE_OFFSET_X:Int = 28;
  private static inline var BLOOD_BADGE_OFFSET_Y:Int = -9;

  public var main:MainScene;
  public var blood_type:BloodType;

  private var sprite:Spritemap;
  private var gender:Gender;
  private var destination:Position; // heading towards
  private var move_speed:Float;
  private var blood_badge_text:Text;
  private var blood_badge:Entity;

  public function new(main:MainScene){
    this.main = main;
    this.gender = (Std.random(2) == 0)? Gender.MALE : Gender.FEMALE ;
    this.move_speed = DEFAULT_MOVESPEED;
    this.blood_type = Type.allEnums(BloodType)[ Std.random(Type.allEnums(BloodType).length) ];
    this.sprite = new Spritemap(GFX_PATH, 72, 72, sprite_loaded);

    this.blood_badge_text = new Text(badge_text(this.blood_type), 0, 0, null, null, {
      size : 16
    });
    this.blood_badge = new Entity( 0, 0, blood_badge_text );
    this.main.add(blood_badge);

    super( -80, Std.random(480));
    
  }
  
  public override function update():Void
  {
    this.blood_badge.visible = this.visible;
    this.blood_badge.x = this.x + BLOOD_BADGE_OFFSET_X;
    this.blood_badge.y = this.y + BLOOD_BADGE_OFFSET_Y;

    if(destination != null){

      if(this.distanceToPoint( destination.x, destination.y ) < 1){
        arrive();
      }else moveTowards(destination.x, destination.y, move_speed);

    }

  }

  public override function removed():Void
  {
    this.main.remove(this.blood_badge);
  }

  private dynamic function sprite_loaded():Void { }
  private dynamic function arrive():Void { destination = null; }

  private inline function toGenderGFX(frames:Array<Int>):Array<Int>
  {
    return if(gender == Gender.FEMALE){
      frames.map( function(frame:Int):Int
      {
        return frame + GFX_OFFSET;
      });
    }else frames;
  }

  private static inline function badge_text(bt:BloodType):String
  {
    var str = Std.string(bt);
    str = StringTools.replace(str, "_POS", "+");
    str = StringTools.replace(str, "_NEG", "-");
    return str;
  }


}