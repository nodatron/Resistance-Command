//Speed boost for all friendly soliders
class Blitz implements Powerup
{
	int buffTime;
	Blitz ()
	{
		//Five minutes
		buffTime = 18000;
	}

	void buff(Solidier solidiers) 
	{
		if (blitzTimer <= buffTime)
		{
			solidiers.forward.mult(2);
		}
	}
}