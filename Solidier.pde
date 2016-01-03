//NOTE: First map needs to follow along y of 20% of height until 50% of width

class Solidier extends GameObject
{
	// Used for checking if the unit hits off a solidier
	boolean isXBorder;
	boolean isYBorder;

	int pointsHit;

	Solidier ()
	{
		this(1);
	}

	Solidier (int level)
	{
		super(level);
		pointsHit = 0;
		init();
	}

	void init()
	{
		// Gets the colour of the solider
		spriteColour = utils.getColourFriendly(level);

		//Get the position of the unit
		//NOTE: 	- This will be replaced by info read from a file
		position.x = mapLayout.get(0).x + (width * 0.05f);
		position.y = mapLayout.get(0).y + (height  * 0.10f);

		goalPosition.x = mapLayout.get(0).x + (width * 0.05f);
		goalPosition.y = mapLayout.get(0).y + (height  * 0.10f);

		// This will be changed for movement towards the goal positon
		speed.x = 1;
		speed.y = 1;
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
		if(pointsHit == (mapLayout.size() / 2))
		{
			println("I'm dead");
			solidier.remove(this);
		}

		if (position.x == goalPosition.x && position.y == goalPosition.y)
		{
			pointsHit ++;
			// println(pointsHit);
			
			if(mapLayout.get(pointsHit).x == mapLayout.get(pointsHit - 1).x)
			{
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y - (height * 0.05f);
			}
			else if(mapLayout.get(pointsHit).y == mapLayout.get(pointsHit - 1).y)
			{
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height * 0.05f);
			}
			else
			{
				goalPosition.x = mapLayout.get(pointsHit).x + (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height * 0.05f);
			}

			if (pointsHit == ((mapLayout.size() / 2) - 1))
			{
				goalPosition = endPoint;
			}
		}

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