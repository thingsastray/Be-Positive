import com.haxepunk.Scene;

class MainScene extends Scene
{

  private var simulator:Simulator;
  private var patients:List<Patient>;
  private var donors:List<Donor>;

  public function new()
  {
    patients = new List<Patient>();
    donors = new List<Donor>();

    super();
  }

	public override function begin()
	{
    
    // add( new com.haxepunk.Entity( 100, 100, new com.haxepunk.graphics.Text()));

    // start spawner
    simulator = new Simulator(this);




	}

}