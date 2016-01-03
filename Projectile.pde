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
	}

	void update()
	{
		forward.x = sin(theta);
		forward.y = - cos(theta);

		position.add(forward);
		// if (position.x < 0 || position.y < 0 || position.x > width || position.y > height)
  //   	{
  //     		projectile.remove(this);
  //   	}
	}

	void render() 
	{
		pushMatrix();
		translate(position.x, position.y);
		rotate(theta);
		stroke(spriteColour);
		ellipse(0, -5, 0, 5);
		popMatrix();
	}
}