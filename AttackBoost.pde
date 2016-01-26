//more damage for each solidier
class AttackBoost extends GameObject implements Powerup
{
	int buffTime;
	AttackBoost()
	{
		buffTime = 7200;
	}

	void buff(Solidier solidiers)
	{
		if (buffTimer < buffTime)
		{
			attackboostActive = true;
			//boost the attack damage of the soliders
			solidiers.attackbonus = 10;
		}
	}


	//TODO Need to add a popup on the screen that comes up when the powerup is activated that lasts
	// for a few seconds and then leaves the screen.  Also may want to add the drawing of the ui
	// elements for the powerups here
	void init()
	{

	}

	void update()
	{

	}

	void render()
	{

	}
}
