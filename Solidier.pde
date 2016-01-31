//NOTE: First map needs to follow along y of 20% of height until 50% of width

class Solidier extends GameObject implements HealthBar
{
	int pointsHit;
	int attackbonus;
	boolean allowedMove;
	color healthColour;
	color missingHealthColour;

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
		health = level * 100;
		// Gets the sprite
		switch(level)
		{
			case 1:
			{
				sprite = loadImage("solidier.png");
			} break;

			case 2:
			{
				sprite = loadImage("solidier2.png");
			} break;

			case 3:
			{
				sprite = loadImage("solidier3.png");
			} break;

			default:
			{
				sprite = loadImage("solidier.png");
			} break;
		}
		// sprite = loadImage("solidier.png");
		attack = utils.getAttackDamage(level, "solidier");

		//Get the starting position of the unit
		position.x = mapLayout.get(0).x + (width * 0.05f);
		position.y = mapLayout.get(0).y + (height   * 0.10f);

		goalPosition.x = mapLayout.get(0).x + (width * 0.05f);
		goalPosition.y = mapLayout.get(0).y + (height   * 0.10f);

		forward.x = 1;
		forward.y = 1;

		healthColour = color(0, 50, 0);
		missingHealthColour = color(255, 0, 0);
	}

	void init()
	{

	}

	void update()
	{

		for (int i = gameObjects.size() - 1 ; i >= 0 ; i--)
		{
			boolean hit = checkCollison(gameObjects.get(i));
			if(hit && gameObjects.get(i) instanceof Projectile)
			{
				gameObjects.remove(i);
			}
			else if(hit && gameObjects.get(i) instanceof Battlements)
			{
				allowedMove = false;
				gameObjects.get(i).health -= attack + gameObjects.get(i).armour;
			}
			else
			{
				allowedMove = true;
			}
		}

		if(health <= 0)
		{
			isAlive = false;
			scoreState.solidiersDead ++;
		}

		//Resetting the attack bonus to 0 when the buff is not active
		if (!buffActive && !attackboostActive) attackbonus = 0;

		if (position.x >= goalPosition.x && position.y >= goalPosition.y)
		{
			pointsHit ++;

			if(mapLayout.get(pointsHit).x == mapLayout.get(pointsHit - 1).x)
			{
				position.x = goalPosition.x;
				position.y = goalPosition.y;
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y - (height  * 0.05f);
			}
			else if(mapLayout.get(pointsHit).y == mapLayout.get(pointsHit - 1).y)
			{
				position.x = goalPosition.x;
				position.y = goalPosition.y;
				goalPosition.x = mapLayout.get(pointsHit).x - (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height  * 0.05f);
			}
			else
			{
				position.x = goalPosition.x;
				position.y = goalPosition.y;
				goalPosition.x = mapLayout.get(pointsHit).x + (width * 0.05f);
				goalPosition.y = mapLayout.get(pointsHit).y + (height  * 0.05f);
			}

			if (pointsHit == ((mapLayout.size() / 2) - 1))
			{
				goalPosition.x = endPoint.x;
				goalPosition.y = endPoint.y;
				// isAlive = false;
			}

		}

		if(PVector.dist(position, endPoint) == 0)
		{
			isAlive = false;
			playerScore += reward;
			scoreState.amountEarned += reward;
		}

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
			if(buffActive && blitzActive) blitz.buff(this);

			position.add(forward);
		}

	}

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

	void renderHealthBar()
	{
		stroke(healthColour);
		fill(healthColour);
		rect(-(spriteWidth * 0.5f), -(spriteHeight * 0.5f) - 10,
		     map(health, 0, level * 100, 0, spriteWidth),
			 10);
	}

}
