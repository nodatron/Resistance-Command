class Battlements extends GameObject
{
	Battlements ()
	{
		super();
	}
	
	Battlements (int level, float xRatio, float yRatio)
	{
		super(level);
		position.x = width * xRatio;
		position.y = height * yRatio;
		init();
	}

	void init()
	{
		// Gets the colour of the battlement
		//NOTE: This will be changed for a sprite
		spriteColour = utils.getColourEnemy(level);
	}

	void update()
	{
		
	}

	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		stroke(spriteColour);
		ellipse(0, 0, spriteWidth, spriteHeight);
		popMatrix();
	}
}