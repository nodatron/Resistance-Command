// Base solidier class
class Solidier extends GameObject
{
	int pointsHit;
	int attackbonus;
	boolean allowedMove;
	color healthColour;
	color missingHealthColour;

	AudioPlayer sound;

	Solidier ()
	{
		this(1);
	}

	Solidier (int level)
	{
		super(level);
		pointsHit = 0;
		attackbonus = 0;
		allowedMove = false;

		//Get the starting position of the unit
		position.x = mapLayout.get(0).x + (width * 0.05f);
		position.y = mapLayout.get(0).y + (height   * 0.05f);

		//Get the first goal position of the solidiers
		goalPosition.x = mapLayout.get(0).x + (width * 0.05f);
		goalPosition.y = mapLayout.get(0).y + (height   * 0.05f);

		forward.x = 1;
		forward.y = 1;

		healthColour = color(0, 50, 0);
		missingHealthColour = color(255, 0, 0);

		sound = minim.loadFile("playerhit.wav");
	}

	void update()
	{
		//Checks the collisions with the solider
		for (int i = gameObjects.size() - 1 ; i >= 0 ; i--)
		{
			boolean hit = checkCollison(gameObjects.get(i));
			if(hit && gameObjects.get(i) instanceof Projectile)
			{
				gameObjects.remove(i);
				hit();
			}
			else if(hit && gameObjects.get(i) instanceof Battlements)
			{
				allowedMove = false;
				gameObjects.get(i).health -= attack + gameObjects.get(i).armour - attackbonus;
				health -= gameObjects.get(i).attack + armour;
			}
			else
			{
				allowedMove = true;
			}
		}

		//if they have no health then they die
		if(health <= 0)
		{
			isAlive = false;
			scoreState.solidiersDead ++;
		}

		//Resetting the attack bonus to 0 when the buff is not active
		if (!buffActive && !attackboostActive) attackbonus = 0;
		
		// AI for the solidiers to make them walk correctly
		if(PVector.dist(position, goalPosition) <= 10)
		{
			pointsHit ++;

			position.x = goalPosition.x;
			position.y = goalPosition.y;
			if(mapLayout.get(pointsHit).x > mapLayout.get(mapLayout.size() - pointsHit - 1).x)
			{
				if(mapLayout.get(pointsHit).y > mapLayout.get(mapLayout.size() - pointsHit - 1).y)
				{
					// goalPosition.y = p2.y + (p1.y - p2.y);
					goalPosition.y = mapLayout.get(mapLayout.size() - pointsHit - 1).y + ((mapLayout.get(pointsHit).y - mapLayout.get(mapLayout.size() - pointsHit - 1).y) * 0.5f);
				}
				else
				{
					// goalPosition.y = p1.y + (p2.y - p1.y);
					goalPosition.y = mapLayout.get(pointsHit).y + ((mapLayout.get(mapLayout.size() - pointsHit - 1).y - mapLayout.get(pointsHit).y) * 0.5f);
				}
				// goalPosition.x = p2.x + (p1.x - p2.x);
				goalPosition.x = mapLayout.get(mapLayout.size() - pointsHit - 1).x + ((mapLayout.get(pointsHit).x - mapLayout.get(mapLayout.size() - pointsHit - 1).x) * 0.5f);
			}
			else if(mapLayout.get(pointsHit).x < mapLayout.get(mapLayout.size() - pointsHit - 1).x)
			{
				if(mapLayout.get(pointsHit).y > mapLayout.get(mapLayout.size() - pointsHit - 1).y)
				{
					goalPosition.y = mapLayout.get(mapLayout.size() - pointsHit - 1).y + ((mapLayout.get(pointsHit).y - mapLayout.get(mapLayout.size() - pointsHit - 1).y) * 0.5f);
				}
				else
				{
					goalPosition.y = mapLayout.get(pointsHit).y + ((mapLayout.get(mapLayout.size() - pointsHit - 1).y - mapLayout.get(pointsHit).y) * 0.5f);
				}
				goalPosition.x = mapLayout.get(pointsHit).x + ((mapLayout.get(mapLayout.size() - pointsHit - 1).x - mapLayout.get(pointsHit).x) * 0.5f);
			}

			// half the sze of mapLayout - 1 means there is one point left to go
			// so make them head towards the end point
			if (pointsHit == ((mapLayout.size() / 2) - 1))
			{
				goalPosition.x = endPoint.x;
				goalPosition.y = endPoint.y;
			}

		}

		// the solidier has reached the end o the map
		if(PVector.dist(position, endPoint) <= 5)
		{
			isAlive = false;
			playerScore += reward;
			scoreState.amountEarned += reward;
		}

		// change forward based on where the solidier is in relation to the
		// the goal position
		if(allowedMove)
		{
			if (position.x > goalPosition.x && position.x != goalPosition.x)
			{
				forward.x = -1;
				forward.y = 0;
			}
			if (position.x < goalPosition.x && position.x != goalPosition.x)
			{
				forward.x = 1;
				forward.y = 0;
			}
			if (position.y > goalPosition.y && position.y != goalPosition.y)
			{
				forward.x = 0;
				forward.y = -1;
			}
			if (position.y < goalPosition.y && position.y != goalPosition.y)
			{
				forward.x = 0;
				forward.y = 1;
			}
			// if blitz has been activated buff the solidiers
			if(buffActive && blitzActive) blitz.buff(this);

			position.add(forward);
		}

	}

	//draw the solidier and the healthbar
	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		stroke(missingHealthColour);
		fill(missingHealthColour);
		rect(-(spriteWidth * 0.5f), -(spriteHeight * 0.5f) - 10, spriteWidth, 10);
		renderHealthBar();
		tint(255, 255);
		image(sprite, -(spriteWidth * 0.5f), -(spriteHeight * 0.5f), spriteWidth, spriteHeight);
		popMatrix();
	}

	// checks if the solidier has collided with another object
	boolean checkCollison(GameObject object)
	{
		if (object.position.x < position.x + (spriteWidth * 0.5f) &&
			object.position.x > position.x - (spriteWidth * 0.5f) &&
			object.position.y < position.y + (spriteHeight * 0.5f) &&
			object.position.y > position.y - (spriteHeight * 0.5f))
		{
			if (object instanceof Projectile)
			{
				health -= (object.attack + armour);
				return true;
			}
			if (object instanceof Battlements)
			{
				return true;
			}
		}

		return false;
	}

	// draw the healthbar for the solidier
	void renderHealthBar()
	{
		stroke(healthColour);
		fill(healthColour);
		rect(-(spriteWidth * 0.5f), -(spriteHeight * 0.5f) - 10,
		     map(health, 0, level * 100, 0, spriteWidth),
			 10);
	}

	// plays a sound
	void hit()
	{
		sound.rewind();
		sound.play();
	}

}
