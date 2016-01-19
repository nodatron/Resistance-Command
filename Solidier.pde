//NOTE: First map needs to follow along y of 20% of height until 50% of width

class Solidier extends GameObject
{
	int pointsHit;
	int attackbonus;

	Solidier ()
	{
		this(1);
	}

	Solidier (int level)
	{
		super(level);
		pointsHit = 0;
		attackbonus = 0;
		init();
	}

	void init()
	{
		// Gets the colour of the solider
		spriteColour = utils.getColourFriendly(level);
		attack = utils.getAttackDamage(level, "solidier");

		//Get the starting position of the unit
		position.x = mapLayout.get(0).x + (width * 0.05f);
		position.y = mapLayout.get(0).y + (height   * 0.10f);

		goalPosition.x = mapLayout.get(0).x + (width * 0.05f);
		goalPosition.y = mapLayout.get(0).y + (height   * 0.10f);

		forward.x = 1;
		forward.y = 1;
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
		// if(pointsHit == (mapLayout.size() / 2))
		// {
		// 	println("I'm dead");
		// 	solidier.remove(this);
		// }

		checkCollison();

		//Resetting the attack bonus to 0 when the buff is not active
		if (!buffActive) attackbonus = 0;

		if (position.x == goalPosition.x && position.y == goalPosition.y)
		{
			pointsHit ++;
			
			if(mapLayout.get(pointsHit).x == mapLayout.get(pointsHit - 1).x)
			{
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y - (height  * 0.05f);
			}
			else if(mapLayout.get(pointsHit).y == mapLayout.get(pointsHit - 1).y)
			{
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height  * 0.05f);
			}
			else
			{
				goalPosition.x = mapLayout.get(pointsHit).x + (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height  * 0.05f);
			}

			if (pointsHit == ((mapLayout.size() / 2) - 1))
			{
				goalPosition = endPoint;
				isAlive = false;
			}
		}

		if (position.x > goalPosition.x && position.x != goalPosition.x)
		{
			forward.x = -1;
			forward.y = 0;
			if(buffActive) blitz.buff(this);
			// position.x --;
			position.add(forward);
		}
		if (position.x < goalPosition.x && position.x != goalPosition.x) 
		{
			forward.x = 1;
			forward.y = 0;
			if(buffActive) blitz.buff(this);
			position.add(forward);
			// position.x ++;
		}
		if (position.y > goalPosition.y && position.y != goalPosition.y)
		{
			forward.x = 0;
			forward.y = -1;
			if(buffActive) blitz.buff(this);
			position.add(forward);
			// position.y --;
		}
		if (position.y < goalPosition.y && position.y != goalPosition.y) 
		{
			forward.x = 0;
			forward.y = 1;
			if(buffActive) blitz.buff(this);
			position.add(forward);
			// position.y++;
		}
		
	}	

	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		stroke(spriteColour);
		ellipse(0, 0, spriteWidth, spriteHeight);
		println("Solider Postion" + position);
		popMatrix();
	}

	void checkCollison()
	{
		
	}
}