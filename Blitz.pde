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