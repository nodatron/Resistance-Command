class RCUtils
{
	RCUtils () {}
	//NOTE: This could be an interface, as eoin what he thinks
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


	void checkMode()
	{
		if (isGame)		//FIXME: The game doesnt reset the position or the firing of the solidiers and the projectiles when you switch
						// between the game modes
		{
			if(solidierLvl1Bought)
			{
				Solidier newSol = new Solidier(1);
				gameObjects.add(newSol);
				solidierLvl1Bought = false;
			}

			if(solidierLvl2Bought)
			{
				Solidier newSol = new Solidier(2);
				gameObjects.add(newSol);
				solidierLvl2Bought = false;
			}

			if(solidierLvl3Bought)
			{
				Solidier newSol = new Solidier(3);
				gameObjects.add(newSol);
				solidierLvl3Bought = false;
			}

			if(blitzActive)
			{
				buffActive = true;
			}

			if(attackboostActive)
			{
				buffActive = true;
			}



			background(0, 128, 0);
			// shape(map.currentlevel);
			for(int i = 0 ; i < gameObjects.size() ; i ++)
			// for(int i = gameObjects.size() - 1 ; i >= 0 ; i --)
			{
				if(gameObjects.get(i).isAlive)
				{
					gameObjects.get(i).update();
					gameObjects.get(i).render();
				}
				else
				{
					gameObjects.remove(i);
				}
			}

			stroke(0);
			ui.update();
			ui.render();
			ui.checkUIButtonPressed();
			ui.checkUIKeyPressed();

			if(buffActive) startBuffCounter();

			if(blitzActive)
			{

			}

			elapsed++;
			solSpawnTimer++;
		}
		else if (isMenu)
		{
			//the player is in the controls page
			// gameObjects.clear();
			menu.update();
			menu.render();
		}
		else if (isInstructions)
		{
			instruct.init();
			instruct.render();
		}
	}

	void checkKeys()
	{
		if(keys['P'])
		{
			isGame = true;
			isMenu = false;
			isInstructions = false;
		}
		else if(keys['M'])
		{
			isGame = false;
			isMenu = true;
			isInstructions = false;
		}
		else if(keys['I'])
		{
			isGame = false;
			isMenu = false;
			isInstructions = true;
		}
	}

	void startBuffCounter()
	{
		buffTimer++;
	}

}
