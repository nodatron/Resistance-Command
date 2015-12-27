class RCUtils
{
	RCUtils () {}

	color getColourFriendly(int level)
	{
		switch (level) 
		{
			case 1:
			{
				return(color(0, 153, 51));
			}

			case 2:
			{
				return(color(51, 51, 0));
			}

			case 3:
			{
				return(color(0, 0, 255));
			}

			default:
			{
				return(color(0));
			}
		}
	}

	color getColourEnemy(int level)
	{
		switch (level) 
		{
			case 1:
			{
				return(color(255, 0, 0));
			}

			case 2:
			{
				return(color(179, 0, 0));
			}

			case 3:
			{
				return(color(51, 0, 0));
			}

			default:
			{
				return(color(0));
			}
		}
	}
}