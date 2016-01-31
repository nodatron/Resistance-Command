class RCUtils
{
	RCUtils () {}
	//NOTE: This could be an interface
	int getAttackDamage (int level, String unitType)
	{
		if (unitType.equals("battlement"))
		{
			switch (level)
			{
				case 1: { return 20; }
				case 2: { return 30; }
				case 3: { return 40; }
				default: { return 20; }
			}
		}
		else if (unitType.equals("solidier"))
		{
			switch (level)
			{
				case 1: { return 10; }
				case 2: { return 20; }
				case 3: { return 30; }
				default: { return 10; }
			}
		}
		return 0;
	}
}
