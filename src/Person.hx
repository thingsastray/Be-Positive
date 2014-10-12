import com.haxepunk.graphics.Spritemap;
import com.haxepunk.Entity;

enum Gender
{
  MALE;
  FEMALE;
}

class Person extends Entity
{
  public static inline var GFX_OFFSET:Int = 6; // how many frames away female equivalent sprites are
  public static inline var GFX_PATH:String = "graphics/persons_72x72.png";

  public var main:MainScene;

  private var sprite:Spritemap;
  private var gender:Gender;

  public function new(main:MainScene){
    this.main = main;
    this.gender = (Std.random(2) == 0)? Gender.MALE : Gender.FEMALE ;

    sprite = new Spritemap(GFX_PATH, 72, 72, sprite_loaded);

    super( -80, Std.random(480));
    
  }

  private dynamic function sprite_loaded():Void { }

  private inline function toGenderGFX(frames:Array<Int>):Array<Int>
  {
    return if(gender == Gender.FEMALE){
      frames.map( function(frame:Int):Int
      {
        return frame + GFX_OFFSET;
      });
    }else frames;
  }

}