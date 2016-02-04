// Class for the towers in the game
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

	void update()
	{

		// check if a solidier is within range and if so fire a bullet
		for (int i = 0 ; i < gameObjects.size() ; i ++)
		{
			if(gameObjects.get(i) instanceof Solidier)
			{
				// gets the angle the projectile needs to go
				theta = findDirectionToShoot(gameObjects.get(i).position, this.position);

				// spawns a new projectile and gives it the neccessary stats, plays a sound and adds the projectile to gameObjects
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

		// no health means dead
		if(health <= 0)
		{
			isAlive = false;
		}
	}

	void render()
	{
		//draw the tower
		pushMatrix();
		translate(position.x, position.y);
		stroke(spriteColour);
		tint(255, 255);
		image(sprite, -(spriteWidth * 0.5f), -(spriteHeight * 0.5f), spriteWidth, spriteHeight);
		popMatrix();
	}

	float findDirectionToShoot (PVector solidierPos, PVector battlementPos)
	{
		//gets the angle for the bullet to fire
		return atan2(position.y - solidierPos.y, position.x - solidierPos.x) - HALF_PI;
	}

	//play the sound
	void fire()
	{
		sound.rewind();
		sound.play();
	}
}
