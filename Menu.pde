class Menu extends GameObject
{
	int menuTextSize;
	PImage backgroundImage;
	color textColour;
	Menu () 
	{
		super();
	}

	void init()
	{
		backgroundImage = loadImage("menubackground.jpg");
		menuTextSize = 32;
	}

	void update() 
	{
		position.x = width * 0.5f;
		position.y = height * 0.5f;

		textColour = color(random(0, 255),
						   random(0, 255),
						   random(0, 255));
	}

	void render()
	{
		fill(textColour);
		text("Resistance Command: Tower Offense", 
			  position.x, 
			  position.y);
	}
}