class Ui extends GameObject
{
	PImage sprite2;

	Ui ()
	{
		sprite = loadImage("blitz.jpg");
		sprite2 = loadImage("attackboost.jpg");
		spriteHeight = height * 0.1f;
		spriteWidth = width * 0.1f;
	}

	void init()
	{
		
	}

	void update()
	{

	}

	void render()
	{
		pushMatrix();
		//Display them at half opacity when not active
		if(blitzActive)
		{
			tint(255, 255);
			image(sprite, width * 0.5f, height - spriteHeight, spriteWidth, spriteHeight);	
		}
		else 
		{
			tint(255, 127);
			image(sprite, width * 0.5f, height - spriteHeight, spriteWidth, spriteHeight);	
		}

		if(attackboostActive)
		{
			tint(255, 255);
			image(sprite2, width * 0.6f, height - spriteHeight, spriteWidth, spriteHeight);	
		}
		else 
		{
			tint(255, 127);
			image(sprite2, width * 0.6f, height - spriteHeight, spriteWidth, spriteHeight);	
		}
		popMatrix();
	}
}