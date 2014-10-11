import com.haxepunk.Scene;

class MainScene extends Scene
{
  /*
    has priority over donor spawn
    lower number is higher rate, based on simulation speed
    200 too high
    10 is too low
  */
  public static inline var SPAWN_PATIENT_RATE:Int = 100;

  /*
    lower number is higher rate, based on simulation speed
    200 too high
    10 is too low
  */
  public static inline var SPAWN_DONOR_RATE:Int = 100;

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

  private inline function spawn(t:Class<Person>):Void
  {
    switch (t) {
      case Patient: patients.add( new Patient(this) );
      case Donor: donors.add( new Donor(this) );
    }
  }

  // called from simulator
  public function spawner(age:Int):Void
  {
    // randomly spawn patients and donors
    if( Std.random( SPAWN_PATIENT_RATE ) == 0 ){
      spawn(Patient);
    }else if( Std.random( SPAWN_DONOR_RATE ) == 0 ){
      spawn(Donor);
    }
  }

}