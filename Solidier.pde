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
		spriteColour = utils.getColour(level);

		//Get the position of the unit
		//NOTE: 	- This will be replaced by info read from a file
		position.x = 100;
		position.y = 100;

		goalPosition.x = width * 0.5f;
		goalPosition.y = height - 100;

		// This will be changed for movement towards the goal positon
		speed.x = 1;
		speed.y = 0;
		println("In the init function");
	}

	void update()
	{
		// Get the distance between the solider and final position
		distance = distance.sub(position, goalPosition, distance);

		// Moves the solider towards the final position
		//NOTE: 	This should be changed for a more advanced version of movement if I have the time


		//TODO:	The ifs should have two parts to check if the solidier is greater in and y, 
		//		greater in x and less in y, less in x and greater in y, less in x and less in y
		// if ((goalPosition.x - distance.x) > 0  && (goalPosition.y - distance.y) > 0)
		if (distance.x > distance.y)
		{
			position.x ++;
		}
		else if (distance.x < distance.y)
		{
			position.y ++;
		}
		// else if ((goalPosition.x - distance.x) > 0 && (goalPosition.y - distance.y) < 0) 
		// {
			
		// }
		// else if ((goalPosition.x - distance.x) < 0 && (goalPosition.y - distance.y) > 0) 
		// {
			
		// }
		// else if ((goalPosition.x - distance.x) < 0 && (goalPosition.y - distance.y) < 0) 
		// {
			
		// }
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