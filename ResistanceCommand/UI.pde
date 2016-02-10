// User interface for when the game is in playstate
class Ui extends GameObject
{
	Blitz blitz;
	AttackBoost attack;
	PImage sol;
	PImage sol2;
	PImage sol3;
	PImage sprite2;
	color scoreColour;
	int baseCost;

	Ui ()
	{
		sol = loadImage("solidier.png");
		sol2 = loadImage("solidier2.png");
		sol3 = loadImage("solidier3.png");
		sprite = loadImage("blitz.jpg");
		sprite2 = loadImage("attackboost.jpg");
		spriteHeight = height * 0.1f;
		spriteWidth = width * 0.1f;
		scoreColour = color(127, 0, 0);
		baseCost = 100;
	}

	// changes the alpha of the images based on whether the user can afford certain units
	void update()
	{
		//Checking if the button was pressed
		if(playerScore < 3 * baseCost)
		{
			canAffordSolidierLvl3 = false;
		}
		else
		{
			canAffordSolidierLvl3 = true;
		}

		if(playerScore < 2 * baseCost)
		{
			canAffordSolidierLvl2 = false;
		}
		else
		{
			canAffordSolidierLvl2 = true;
		}

		if(playerScore < 1 * baseCost)
		{
			canAffordSolidierLvl1 = false;
		}
		else
		{
			canAffordSolidierLvl1 = true;
		}
	}

	void render()
	{
		//Display the Units that can be spawned
		if(canAffordSolidierLvl1)
		{
			tint(255, 255);
			image(sol, 0, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol, 0, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl2)
		{
			tint(255, 255);
			image(sol2, width * 0.1f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol2, width * 0.1f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(canAffordSolidierLvl3)
		{
			tint(255, 255);
			image(sol3, width * 0.2f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sol3, width * 0.2f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		//Displays the buffs that are availible
		if(!blitzActive && !buffActive)
		{
			tint(255, 255);
			image(sprite, width * 0.5f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sprite, width * 0.5f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		if(!attackboostActive && !buffActive)
		{
			tint(255, 255);
			image(sprite2, width * 0.6f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}
		else
		{
			tint(255, 127);
			image(sprite2, width * 0.6f, MAP_HEIGHT, spriteWidth, spriteHeight);
		}

		fill(scoreColour);
		text((int)playerScore, width * 0.9f, height * 0.05f);
	}

	// checks if the user presses mouse in certain area
	void checkUIButtonPressed()
	{
		if(mousePressed && solSpawnTimer > 30)
		{
			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > 0 && mouseX < spriteWidth &&
			   canAffordSolidierLvl1)
			{
				// The level one solidier has been pressed
				solidierLvl1Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > spriteWidth && mouseX < (spriteWidth * 2.0f)
			   && canAffordSolidierLvl2)
			{
				// The level two solidier has been pressed
				solidierLvl2Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 2.0f) && mouseX < (spriteWidth * 3.0f)
			   && canAffordSolidierLvl3)
			{
				// The level three solidier has been pressed
				solidierLvl3Bought = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 5.0f) && mouseX < (spriteWidth * 6.0f))
			{
				// Blitz buff has been pressed
				blitzActive = true;
			}

			if(mouseY > MAP_HEIGHT && mouseY < height
			   && mouseX > (spriteWidth * 6.0f) && mouseX < (spriteWidth * 7.0f))
			{
				// Attack boost buff has been pressed
				attackboostActive = true;
			}

			solSpawnTimer = 0;
		}
	}

	//checks if the user presses a specific key
	void checkUIKeyPressed()
	{
		if(keyPressed && solSpawnTimer > 30)
		{
			if(keys['1'] && canAffordSolidierLvl1)
			{
				solidierLvl1Bought = true;
			}

			if(keys['2'] && canAffordSolidierLvl2)
			{
				solidierLvl2Bought = true;
			}

			if(keys['3'] && canAffordSolidierLvl3)
			{
				solidierLvl3Bought = true;
			}

			if(keys['A'] && !buffActive)
			{
				attackboostActive = true;
			}

			if(keys['B'] && !buffActive)
			{
				blitzActive = true;
			}

			solSpawnTimer = 0;
		}
	}
}
