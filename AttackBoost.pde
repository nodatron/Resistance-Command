//more damage for each solidier
class AttackBoost implements Powerup 
{
	int buffTime;
	AttackBoost()
	{
		buffTime = 7200;
	}

	void buff(Solidier solidiers) 
	{
		if (attackBoostTimer < buffTime)
		{
			//boost the attack damage of the soliders
		}
	}
}