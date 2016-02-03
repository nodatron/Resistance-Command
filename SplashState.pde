class SplashState extends GameObject implements State
{
	int menuTextSize;
	PImage backgroundImage;
	color buttonColour;
	float length;
	float halfLength;

	// AudioPlayer sound;
 //    boolean menuThemePlayed;

	SplashState ()
	{
		super();
		// sound = minim.loadFile("menutheme.wav");
		// menuThemePlayed = false;
		backgroundImage = loadImage("rcbackground.jpg");
		menuTextSize = 32;
		length = textWidth("Click to Play or press P");
		halfLength = length * 0.5f;
	}

	void update()
	{
		position.x = width * 0.5f;
		position.y = height * 0.75f;


		buttonColour = color(153, 187, 255);

		handleInput();

		// playTheme();
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

	void handleInput()
	{
		if(keys['P'])
		{
			isGame = true;
			isMenu = false;
			isInstructions = false;
			// playState.newGame = true;
			// menuThemePlayed = false;

		}
		else if(keys['M'])
		{
			isGame = false;
			isMenu = true;
			isInstructions = false;

		}
		else if(keys['I'])
		{
			isGame = false;
			isMenu = false;
			isInstructions = true;
			// sound.pause();
			// menuThemePlayed = false;
		}


		if(mousePressed &&
		   mouseX > position.x - halfLength &&
		   mouseX < position.x + halfLength &&
		   mouseY > position.y - 15 &&
		   mouseY < position.y + 15)
		{
			isMenu = false;
			isGame = true;
			isInstructions = false;
			// sound.pause();
			// menuThemePlayed = false;
		}

		 if(mousePressed &&
			mouseX > position.x - halfLength &&
			mouseX < position.x + halfLength &&
			mouseY > position.y + 35 &&
			mouseY < position.y + 65)
		 {
			isMenu = false;
			isGame = false;
			isInstructions = true;
			// sound.pause();
			// menuThemePlayed = false;
		 }
	}

	// void playTheme()
	// {
	// 	if(!menuThemePlayed)
	// 	{
	// 		sound.rewind();
	// 		sound.play();
	// 		menuThemePlayed = true;
	// 	}
	// }
}
