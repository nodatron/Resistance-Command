class Solidier extends GameObject
{
	Solidier ()
	{
		this(1);
	}

	Solidier (int level)
	{
		super(level);
		init();
	}

	void init()
	{
		// Gets the colour of the solider
		spriteColor = utils.getColour(level);

		//Get the position of the unit
		//NOTE: 	- This will be replaced by info read from a file
		position.x = 100;
		position.y = 100;

		goalPosition.x = width * 0.5f;
		goalPosition.y = height - 100;

		// This will be changed for movement towards the goal positon
		speed.x = 1;
		speed.y = 0;
	}

	void update()
	{

	}

	void render()
	{

	}
}