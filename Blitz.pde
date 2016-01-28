//Speed boost for all friendly soliders
class Blitz extends GameObject implements Powerup
{
	int buffTime;

	Blitz ()
	{
		//Five minutes
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
		// update();
		// render();
	}
	//FIXME The image is not being displayed onto the screen when it is called
	//TODO Need to add a popup on the screen that comes up when the powerup is activated that lasts
	// for a few seconds and then leaves the screen.  Also may want to add the drawing of the ui
	// elements for the powerups here
	void init()
	{

	}
	void update()
	{
		if (blitzActive)
		{
			for (int i = gameObjects.size() - 1 ; i >= 0 ; i --)
			{
				if (gameObjects.get(i) instanceof Solidier)
				{
					buff((Solidier)gameObjects.get(i));
					imageLock = true;
				}
			}
		}
		//Makes BLITZ appear on the screen fading in and out over the course of a 5 seconds
		// println(buffTimer);
		// if(buffTimer < 300)
		// {
		// 	itint += (300 / 255);
		// 	// println("blitz should appear");
		// }
		// else
		// {
		// 	itint = 0;
		// }
	}
	void render()
	{
		println(buffTimer);
		if(blitzActive && buffTimer < 300)
		{
			// tint(255, itint);
			// image(sprite, width * 0.25f, height * 0.25f, width * 0.5f, height * 0.2f);
			text("BLITZ", width * 0.5f, height * 0.5f);
		}
	}
}
