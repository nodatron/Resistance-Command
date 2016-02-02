//Speed boost for all friendly soliders
//TODO Make the image appear instead of writing
class Blitz extends GameObject implements Powerup
{
	int buffTime;

	Blitz ()
	{
		//NOTE this needs to change **Five minutes
		buffTime = 18000;
		sprite = loadImage("blitztext.png");
	}

	void buff(Solidier solidiers)
	{
		if (buffTimer <= buffTime)
		{
			blitzActive = true;
			solidiers.forward.mult(3);
		}
	}
	//FIXME The image is not being displayed onto the screen when it is called
	//TODO Need to add a popup on the screen that comes up when the powerup is activated that lasts
	// for a few seconds and then leaves the screen.  Also may want to add the drawing of the ui
	// elements for the powerups here
	// void init()
	// {
	// }

	void update()
	{
		if (blitzActive)
		{
			for (int i = gameObjects.size() - 1 ; i >= 0 ; i --)
			{
				if (gameObjects.get(i) instanceof Solidier)
				{
					buff((Solidier)gameObjects.get(i));
					// itint += (255/300);
					if(buffTimer < 300)
					{
						blitzAnimation = true;
					}
					else
					{
						blitzAnimation = false;
					}
				}
			}

			if(buffTimer > 1800)
			{
				blitzActive = false;
				buffActive = false;
				buffTimer = 0;
			}
		}

	}

	void render()
	{
		if(blitzAnimation)
		{
			// tint(255, itint);
			// image(sprite, width * 0.25f, height * 0.25f, width * 0.5f, height * 0.2f);
			// println(buffTimer);
			text("BLITZ", width * 0.5f, height * 0.5f);
		}
	}
}
