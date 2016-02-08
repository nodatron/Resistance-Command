// Boosts the attack damage for all the solidiers
class AttackBoost extends GameObject implements Powerup
{
	int buffTime;
	int bonus;

	AudioPlayer sound;
	boolean powerupSoundPlayed;

	AttackBoost()
	{
		buffTime = 7200;
		bonus = 10;
		sound = minim.loadFile("powerup.wav");
		powerupSoundPlayed = false;
		attackboostActive = false;
		attackBAnimation = false;
		buffActive = false;
		buffTimer = 0;
	}

	// increases the bonus damage for the solidier
	void buff(Solidier solidier)
	{
		if (buffTimer <= buffTime)
		{
			attackboostActive = true;
			solidier.attackbonus = bonus;
		}
	}

	void update()
	{
		// if the buff has been activated buff every solidier
		if (attackboostActive)
		{
			for (int i = gameObjects.size() - 1 ; i >= 0 ; i --)
			{
				if (gameObjects.get(i) instanceof Solidier)
				{
					buff((Solidier)gameObjects.get(i));
				}
			}
			// makes the word attackboost show on screen for a few seconds then disapear
			if(buffTimer < 300)
			{
				attackBAnimation = true;
			}
			else
			{
				attackBAnimation = false;
			}

			// stop the buff after a certain amount of time
			if(buffTimer > buffTime)
			{
				attackboostActive = false;
				buffActive = false;
			}
		}

	}

	void render()
	{
		// display the message and play sound
		if(attackBAnimation)
		{
			text("ATTACK BOOST", width * 0.5f, height * 0.5f);
			playSound();
		}
	}

	void playSound()
	{
		//only play the sound once
		if(!powerupSoundPlayed)
		{
			sound.rewind();
			sound.play();
			powerupSoundPlayed = true;
		}
	}
}
