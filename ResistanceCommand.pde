// Used for util functions throughout the game
RCUtils utils = new RCUtils();

ArrayList<PVector> mapLayout = new ArrayList<PVector>();

ArrayList<Battlements> battlements = new ArrayList<Battlements>();

Solidier solidier;
Map map;

void setup()
{
	fullScreen();
	background(255);

	solidier =  new Solidier();
	map = new Map();

	
	

}

void draw()
{
	background(255);
	//NOTE: This will be replaced by input from the user as to which map they want
	map.init(1, 1);
	solidier.render();
	solidier.update();
	for (Battlements b : battlements) 
	{
		b.render();
		b.update();
	}
}