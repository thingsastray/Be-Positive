import com.haxepunk.Scene;

class MainScene extends Scene
{
	public override function begin()
	{
    trace("Hello Console");
    add( new com.haxepunk.Entity( 100, 100, new com.haxepunk.graphics.Text(BloodTransfusionRules.rule1)));
	}
}