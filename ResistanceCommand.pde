// Used for util functions throughout the game
RCUtils utils = new RCUtils();

ArrayList<PVector> mapLayout = new ArrayList<PVector>();

ArrayList<Battlements> battlements = new ArrayList<Battlements>();

PShape currentlevel;

Solidier solidier;
Map map;

void setup()
{
	fullScreen();
	background(0, 128, 0);
	frameRate(90);
	
	map = new Map();
	//NOTE: This will be replaced by input from the user as to which map they want
	map.init(1, 1);
	solidier =  new Solidier();

}

void draw()
{
	background(0, 128, 0);
	shape(currentlevel);
	solidier.render();
	solidier.update();
	for (Battlements b : battlements) 
	{
		b.render();
		b.update();
	}
}