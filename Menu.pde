class Menu extends GameObject
{
	int menuTextSize;
	PImage backgroundImage;
	color buttonColour;

	Menu () 
	{
		super();
		init();
	}

	void init()
	{
		backgroundImage = loadImage("rcbackground.jpg");
		menuTextSize = 32;
	}

	void update() 
	{
		position.x = width * 0.5f;
		position.y = height * 0.75f;


		buttonColour = color(153, 187, 255);
	}

	void render()
	{
		fill(buttonColour);
		image(backgroundImage, 0, 0, width, height);
		textAlign(CENTER, CENTER);
		textSize(menuTextSize);
		text("Click to Play or press P", position.x, position.y);
		text("Click to Show Controls or press I", position.x, position.y + 50);
	}
}