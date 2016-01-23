class Ui extends GameObject
{
	Blitz blitz;
	AttackBoost attack;
	PImage sol;
	PImage sol2;
	PImage sol3;
	PImage sprite2;

	Ui ()
	{
		sol = loadImage("solidier.png");
		sol2 = loadImage("solidier2.png");
		sol3 = loadImage("solidier3.png");
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
		//Checking if the button was pressed
	}

	void render()
	{
		//Display the Units that can be spawned
		if(canAffordSolidierLvl1)
		{
			tint(255, 255);
			image(sol, 0, height - spriteHeight, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol, 0, height - spriteHeight, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl2)
		{
			tint(255, 255);
			image(sol2, width * 0.1f, height - spriteHeight, spriteWidth, spriteHeight);
		}
		else 
		{
			tint(255, 127);
			image(sol2, width * 0.1f, height - spriteHeight, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl3)
		{
			tint(255, 255);
			image(sol3, width * 0.2f, height - spriteHeight, spriteWidth, spriteHeight);
		}
		else 
		{
			tint(255, 127);
			image(sol3, width * 0.2f, height - spriteHeight, spriteWidth, spriteHeight);
		}

		//Displays the buffs that are availible
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
	}
}