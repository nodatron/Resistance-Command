//more damage for each solidier
class AttackBoost extends GameObject implements Powerup
{
	int buffTime;
	int bonus;
	AttackBoost()
	{
		buffTime = 7200;
		bonus = 10;
		sprite = loadImage("attackboost.png");
	}

	void buff(Solidier solidier)
	{
		if (buffTimer <= buffTime)
		{
			attackboostActive = true;
			//boost the attack damage of the soliders
			solidier.attackbonus = bonus;
		}
		update();
		render();
	}

	//FIXME The image is not showing up on the screen
	//FIXME Need to change how buff is called cause it is causing an index out of bounds exception
	//TODO Need to add a popup on the screen that comes up when the powerup is activated that lasts
	// for a few seconds and then leaves the screen.  Also may want to add the drawing of the ui
	// elements for the powerups here
	void init()
	{

	}

	void update()
	{
		//Makes BLITZ appear on the screen fading in and out over the course of a 5 seconds
		if(blitzActive && buffTime < 300)
		{
			itint += (300 / 255);
		}
		else
		{
			itint = 0;
		}
	}

	void render()
	{
		// tint(255, itint);
		// image(sprite, width * 0.25f, height * 0.25f, width * 0.5f, height * 0.2f);
		text("ATTACK BOOST", width * 0.5f, height * 0.5f);
	}
}
