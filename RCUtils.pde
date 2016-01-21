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

	int getAttackDamage (int level, String unitType)
	{
		if (unitType.equals("battlement"))
		{
			switch (level)
			{
				case 1: { return 10; }
				case 2: { return 20; }
				case 3: { return 30; }
				default: { return 10; }
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

	void initMap(int mapNo, int level)
	{
		// Selects which map that the user wants
		switch (mapNo)
		{
			case 1:
			{
				String[] locations = loadStrings("map1.csv");

				for(String s : locations)
				{
					String[] lines = s.split(",");
					float xRatio = Float.parseFloat(lines[1]);
					float yRatio = Float.parseFloat(lines[2]);
					if (lines[0].equals("battlement"))
					{
						Battlements tower = new Battlements(level, xRatio, yRatio);
						gameObjects.add(tower);
					}
					else if(lines[0].equals("endpoint"))
					{
						endPoint = new PVector(width * xRatio, height  * yRatio);
					}
					else 
					{
						PVector point = new PVector(width * xRatio, height  * yRatio);
						mapLayout.add(point);
					}
				}
				
				currentlevel = createShape();
				currentlevel.beginShape();
				currentlevel.fill(153, 75, 0);
				currentlevel.stroke(153, 75, 0);
				for (int i = 0 ; i < mapLayout.size() ; i ++) 
				{
					currentlevel.vertex(mapLayout.get(i).x, mapLayout.get(i).y);
				}
				currentlevel.endShape(CLOSE);
			} break;

			// case 2:
			// {
			// 	String[] locations = loadStrings("map2.csv");

			// 	for(String s : locations)
			// 	{
			// 		String ratios = s.split(",");
			// 		Battlement tower = new Battlement(level, ratios[0], ratios[1]);
			// 		battlements.add(tower);
			// 	}
			// } break;

			// case 3:
			// {
			// 	String[] locations = loadStrings("map3.csv");

			// 	for(String s : locations)
			// 	{
			// 		String ratios = s.split(",");
			// 		Battlement tower = new Battlement(level, ratios[0], ratios[1]);
			// 		battlements.add(tower);
			// 	}
			// } break;
		}
	}

	void checkMode()
	{
		if (isGame)		//FIXME: The game doesnt reset the position or the firing of the solidiers and the projectiles when you switch 
						// between the game modes
		{
			//the player is in a game
			// switch (gameLevel)
			// {
			// 	case 1:
			// 	case 2:
			// 	case 3:
			// 	default:
			// }
			background(0, 128, 0);
			shape(currentlevel);
			for(int i = 0 ; i < gameObjects.size() ; i ++)
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

			if (mouseY > MAP_HEIGHT && !buffActive && mouseX > width * 0.5f && mouseX < width * 0.6f)
			{
				// blitz.buff(solidier);
				println("Buff activated");
				buffActive = true;	
			}

			if(buffActive) startBuffCounter();

			if (mouseY > MAP_HEIGHT && !buffActive && mouseX < width * 0.5f)
			{
				// blitz.buff(solidier);
				println("Buff activated");
				buffActive = true;	
			}

			if(buffActive) startBuffCounter();

			elapsed++;
		}
		else if (isMenu)
		{
			//the player is in the controls page
			menu.update();
			menu.render();
		}
	}

	void updateMode()
	{
		if (isMenu)
		{
			if(keys['P'])
			{
				isGame = true;
				isMenu = false;
			}
		}
		else if (isGame)
		{
			if(keys['M'])
			{
				isGame = false;
				isMenu = true;
			}
		}
	}
}