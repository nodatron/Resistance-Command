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
		if (buffTimer < buffTime)
		{
			//boost the attack damage of the soliders
			solidiers.attackbonus = 10;
		}
	}
}