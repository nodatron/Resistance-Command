class Projectile extends GameObject
{

	Projectile ()
	{
		super();
		init();
	}

	void init()
	{
		// utils.getProjectileInfo(level);
		spriteColour = utils.getColourEnemy(level);
		spriteWidth = 0;
		spriteHeight = height * 0.5f;
	}

	void update()
	{
		forward.x = sin(theta);
		forward.y = - cos(theta);

		position.add(forward);
		if (position.x < 0 || position.y < 0 || position.x > width || position.y > height)
    	{
      		// Im dead!
      		projectile.remove(this);
    	}
	}

	void render() 
	{
		pushMatrix();
		translate(position.x, position.y);
		rotate(theta);
		stroke(spriteColour);
		ellipse(0, spriteHeight, spriteWidth, -spriteHeight);
		popMatrix();
	}
}