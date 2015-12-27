// Used for util functions throughout the game
RCUtils utils = new RCUtils();

ArrayList<Battlements> battlements = new ArrayList<Battlements>();

Solidier solidier;
Map map;

void setup()
{
	fullScreen();
	background(255);

	solidier =  new Solidier();
	map = new Map();
	map.init(1, 1);

}

void draw()
{
	background(255);
	solidier.render();
	solidier.update();
	for (Battlements b : battlements) 
	{
		b.render();
		b.update();
	}
}