//Speed boost for all friendly soliders
class Blitz extends GameObject implements Powerup
{
	int buffTime;
	Blitz ()
	{
		//Five minutes
		buffTime = 18000;
	}

	void buff(Solidier solidiers)
	{
		if (buffTimer <= buffTime)
		{
			blitzActive = true;
			solidiers.forward.mult(2);
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
