import com.haxepunk.Scene;

class MainScene extends Scene
{

  private static inline var DEFAULT_SIMULATION_SPEED:Float = 10.0;

  private var simulation_speed:Float;

  public function new()
  {

    simulation_speed = try{
      BloodTransfusionRules.simulation_speed;
    }catch(e:Dynamic){
      DEFAULT_SIMULATION_SPEED;
    }

    super();
  }

	public override function begin()
	{
    trace(simulation_speed);
    add( new com.haxepunk.Entity( 100, 100, new com.haxepunk.graphics.Text(simulation_speed)));

    // start spawner
    


	}

}