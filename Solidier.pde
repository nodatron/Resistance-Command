class Solidier extends GameObject
{
	// Used for checking if the unit hits off a solidier
	boolean isXBorder;
	boolean isYBorder;

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
		spriteColour = utils.getColourFriendly(level);

		//Get the position of the unit
		//NOTE: 	- This will be replaced by info read from a file
		position.x = mapLayout.get(0).x + (width * 0.05f);
		position.y = mapLayout.get(0).y + (height  * 0.05f);

		goalPosition.x = width * 0.5f;
		goalPosition.y = height - 100;

		// This will be changed for movement towards the goal positon
		speed.x = 1;
		speed.y = 1;

		println("In the init function");
	}

	void update()
	{
		// NOTE:	MIGHT NEED THIS** Get the distance between the solider and final position
		// distance = distance.sub(position, goalPosition, distance);

		// Moves the solider towards the final position
		//NOTE: 	This should be changed for a more advanced version of movement if I have the time
		// TODO: this is how i will get them in a path
		//			checks if the solidier hits anything 
		// if (isXBorder && isYBorder)
		// {
			if (position.x > goalPosition.x && position.x != goalPosition.x)
			{
				position.x --;
				// position.add(speed);
			}
			if (position.x < goalPosition.x && position.x != goalPosition.x) 
			{
				position.x ++;
				// position.add(speed);
			}
			if (position.y > goalPosition.y && position.y != goalPosition.y)
			{
				position.y --;
				// position.add(speed);
			}
			if (position.y < goalPosition.y && position.y != goalPosition.y) 
			{
				position.y++;
				// position.add(speed);
			}
		// }
		// else if (isXBorder && !isYBorder)
		// {

		// }
		// else if (!isXBorder && isYBorder)
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