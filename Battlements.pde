//can use the function .angleBetween() to find the right way to fire, this is for vectors
class Battlements extends GameObject
{
	boolean isWithinRange;
	PVector solpos;

	AudioPlayer sound;

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
		sound = minim.loadFile("towerfire.wav");
	}

	// void init(){}
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
					fire();
					Projectile p = new Projectile();
					p.position.x = position.x;
					p.position.y = position.y;
					p.theta = theta;
					p.attack = attack;
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
		// println("PI " + PI + " TWO_PI " + TWO_PI);
		return atan2(position.y - solidierPos.y, position.x - solidierPos.x) - HALF_PI;
	}

	void fire()
	{
		sound.rewind();
		sound.play();
	}
}
