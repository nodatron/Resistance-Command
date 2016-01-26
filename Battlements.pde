//can use the function .angleBetween() to find the right way to fire, this is for vectors
class Battlements extends GameObject
{
	boolean isWithinRange;
	PVector solpos;

	Battlements ()
	{
		super();
		isWithinRange = false;
	}

	Battlements (int level, float xRatio, float yRatio)
	{
		super(level);
		position.x = width * xRatio;
		position.y = height  * yRatio;
		isWithinRange = false;
		init();
	}

	void init()
	{
		// Gets the sprite
		sprite = loadImage("battlement.png");
		attack = utils.getAttackDamage(level, "Battlement");
	}

	void update()
	{
		// forward.x = sin(theta);
  		//forward.y = - cos(theta);

		for (int i = 0 ; i < gameObjects.size() ; i ++)
		{
			if(gameObjects.get(i) instanceof Solidier)
			{
				theta = findDirectionToShoot(gameObjects.get(i).position, this.position);

				//TODO make the range different for the different levels of towers

				// TODO make the turret only shoot at one enemy at a time
				if(PVector.dist(this.position, gameObjects.get(i).position) <= 300 && elapsed > 30)
				{
					elapsed = 0;
					Projectile p = new Projectile();
					p.position.x = position.x;
					p.position.y = position.y;
					p.theta = theta;
					gameObjects.add(p);
				}
			}
		}

		if(health <= 0)
		{
			isAlive = false;
		}
	}

	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		stroke(spriteColour);
		tint(255, 255);
		image(sprite, -(spriteWidth * 0.5f), -(spriteHeight * 0.5f), spriteWidth, spriteHeight);
		// ellipse(0, 0, spriteWidth, spriteHeight);
		popMatrix();
	}

	float findDirectionToShoot (PVector solidierPos, PVector battlementPos)
	{
		if (solidierPos.x == battlementPos.x)
		{
			if (solidierPos.y > battlementPos.y)
			{
				// Shoot down
				return PI;
			}
			else
			{
				// Shoot up
				return TWO_PI;
			}
		}
		else
		{
			if (solidierPos.x > battlementPos.x)
			{
				// Shoot right
				return PI * 0.5f;
			}
			else
			{
				// Shoot Left
				return PI * 1.5f;
			}
		}
	}
}
