// Speed boost for all friendly soliders
class Blitz extends GameObject implements Powerup
{
	int buffTime;
	boolean powerupSoundPlayed;
	AudioPlayer sound;

	Blitz ()
	{
		buffTime = 18000;
		sprite = loadImage("blitztext.png");
		powerupSoundPlayed = false;
		blitzActive = false;
		buffActive = false;
		blitzAnimation = false;
		sound = minim.loadFile("powerup.wav");
		buffTimer = 0;
	}

	// increases the speed of all the solidiers
	void buff(Solidier solidiers)
	{
		if (buffTimer <= buffTime)
		{
			blitzActive = true;
			solidiers.forward.mult(2.5);
		}
	}


	void update()
	{
		// if buff has been activated buff every solidier
		if (blitzActive)
		{
			// buff all the solidiers
			for (int i = gameObjects.size() - 1 ; i >= 0 ; i --)
			{
				if (gameObjects.get(i) instanceof Solidier)
				{
					buff((Solidier)gameObjects.get(i));
				}
			}

			// display a message for the user for a few seconds
			if(buffTimer < 100)
			{
				blitzAnimation = true;
			}
			else
			{
				blitzAnimation = false;
				powerupSoundPlayed = false;
			}

			//stop the buff after some time
			if(buffTimer > buffTime)
			{
				blitzActive = false;
				buffActive = false;
				buffTimer = 0;
				powerupSoundPlayed = false;
			}
		}

	}

	//display a message and play a sound
	void render()
	{
		if(blitzAnimation)
		{
			text("BLITZ", width * 0.5f, height * 0.5f);
			playSound();
		}
	}

	//only play the sound once
	void playSound()
	{
		if(!powerupSoundPlayed)
		{
			sound.rewind();
			sound.play();
			powerupSoundPlayed = true;
		}
	}
}
