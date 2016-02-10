class Projectile extends GameObject
{

	Projectile ()
	{
		super();
		spriteColour = getColourEnemy(level);
	}

	void update()
	{
		//gets the direction the bullet needs to fire
		forward.x = sin(theta);
		forward.y = - cos(theta);

		position.add(forward);
		// get rid of the bullet if it goes outside the map
		if (position.x < 0 || position.y < 0 || position.x > width || position.y > height )
    	{
      		isAlive = false;
       	}
	}

	// render the bullet
	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		rotate(theta);
		stroke(spriteColour);
		ellipse(0, -5, 0, 5);
		popMatrix();
	}

	//gets the colour of the bullet based on the enemy level
	//NOTE this may be taken out
	color getColourEnemy(int level)
	{
		switch (level)
		{
			case 1:
			{
				return(color(255, 0, 0));
			}

			case 2:
			{
				return(color(179, 0, 0));
			}

			case 3:
			{
				return(color(51, 0, 0));
			}

			default:
			{
				return(color(0));
			}
		}
	}
}
