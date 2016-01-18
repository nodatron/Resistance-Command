//can use the function .angleBetween() to find the right way to fire, this is for vectors
class Battlements extends GameObject
{
	boolean isTargetting;

	Battlements ()
	{
		super();
		isTargetting = true;
	}
	
	Battlements (int level, float xRatio, float yRatio)
	{
		super(level);
		position.x = width * xRatio;
		position.y = MAP_HEIGHT * yRatio;
		isTargetting = false;
		init();
	}

	void init()
	{
		// Gets the colour of the battlement
		//NOTE: This will be changed for a sprite
		spriteColour = utils.getColourEnemy(level);
		attack = utils.getAttackDamage(level, "Battlement");
	}

	void update()
	{
		// forward.x = sin(theta);
  		//forward.y = - cos(theta);

		for (Solidier s : solidier)
		{
			theta = findDirectionToShoot(s.position, this.position);

			if(PVector.dist(this.position, s.position) <= 300 && elapsed > 30)
			{
				elapsed = 0;
				Projectile p = new Projectile();
				p.position.x = position.x;
				p.position.y = position.y;
				p.theta = theta;
				projectile.add(p);
				gameObjects.add(p);
			}
		}
	}

	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		// rotate(theta);
		stroke(spriteColour);
		ellipse(0, 0, spriteWidth, spriteHeight);
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