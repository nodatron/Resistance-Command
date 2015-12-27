// Used for util functions throughout the game
RCUtils utils = new RCUtils();
Solidier solidier;

void setup()
{
	fullScreen();
	background(255);

	solidier =  new Solidier();
}

void draw()
{
	background(255);
	solidier.render();
	solidier.update();
}