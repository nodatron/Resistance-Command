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
		position.y = height * yRatio;
		isTargetting = false;
		init();
	}

	void init()
	{
		// Gets the colour of the battlement
		//NOTE: This will be changed for a sprite
		spriteColour = utils.getColourEnemy(level);
	}

	void update()
	{
		// forward.x = sin(theta);
  //   	forward.y = - cos(theta);

		for (Solidier s : solidier)
		{
			theta = PI + PVector.angleBetween(s.position, position);
			if(PVector.dist(position, s.position) <= 300 && elapsed > 12)
			// if (s.position.x + s.spriteWidth > position.x - 100 
			// 	|| s.position.x - s.spriteWidth < position.y + 100 
			// 	|| s.position.y + s.spriteHeight > position.y - 100 
			// 	|| s.position.y - s.spriteHeight < position.y + 100
			// 	&& isTargetting == false)
			{
				elapsed = 0;
				isTargetting = true;
				// theta = PVector.angleBetween(position, s.position);
				Projectile p = new Projectile();
				p.position.x = position.x;
				p.position.y = position.y;
				p.theta = theta;
				projectile.add(p);
			}
		}
	}

	void render()
	{
		pushMatrix();
		translate(position.x, position.y);
		rotate(theta);
		stroke(spriteColour);
		ellipse(0, 0, spriteWidth, spriteHeight);
		popMatrix();
	}
}