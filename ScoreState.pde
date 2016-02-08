// Shows and trakes some stats for the player during each game
class ScoreState extends GameObject implements State
{

    // Player related stats
    int solidiersSpawned;
    int lvl1SolSpawned;
    int lvl2SolSpawned;
    int lvl3SolSpawned;
    int solidiersDead;
    int amountSpent;
    int amountEarned;

    // apperance
    int textSize;
    color backgroundColour;
    color textColour;
    boolean mapFailed;

    //for the next and retry parts
    int mapNumber;
    int level;

    //audio related
    boolean winSoundPlayed;
    boolean failSoundPlayed;
    AudioPlayer fail;
    AudioPlayer win;

    ScoreState()
    {
        solidiersSpawned = 0;
        lvl1SolSpawned = 0;
        lvl2SolSpawned = 0;
        lvl3SolSpawned = 0;
        solidiersDead = 0;
        amountSpent = 0;
        amountEarned = 0;

        backgroundColour = color(0, 0, 26);
        textColour = color(235, 240, 250);
        textSize = 26;

        mapFailed = false;

        mapNumber = playState.mapNumber;
        level = playState.level;

        winSoundPlayed = false;
        failSoundPlayed = false;

        fail = minim.loadFile("failure.wav");
        win = minim.loadFile("victory.wav");
    }

    void update()
    {
        //check for the user input in this state
        handleInput();
    }

    // render all the stats, render appropriate message based on whether the map
    // was cleared or not and play a sound
    void render()
    {
        background(backgroundColour);
        fill(textColour);
        textSize(textSize);
        text("Solidiers Spawned: " + solidiersSpawned, 300, 100);
        text("Level 1 Solidiers spawned: " + lvl1SolSpawned, 300, 150);
        text("Level 2 Solidiers spawned: " + lvl2SolSpawned, 300, 200);
        text("Level 3 Solidiers spawned: " + lvl3SolSpawned, 300, 250);
        text("Soliders Dead: " + solidiersDead, 300, 300);
        text("Amount Spent: " + amountSpent, 300, 350);
        text("Amount Earned: " + amountEarned, 300, 400);
        text("Total Score: " + playerScore, 300, 450);

        if(mapFailed)
        {
           failSound();
           text("Your Resistance is crushed, Bow down before the King", width / 2, 50);
           text("Press R to retry the Map", width / 2, height / 2);
        }
        else
        {
            
            winSound();
            if(mapNumber != 3)
            {
                text("A glourious victory for the resistance", width / 2, 50);
                text("Press R to try and beat your score", width / 2, height / 2);
                text("Press N to go to the Next Map", width / 2, (height / 2) + 50);
            }
             else 
            {
                text("The Resistance has won the war.", width / 2, 50);
                text("Press R to try and beat your score", width / 2, height / 2);
            }
        }

    }

    // check if the player wants to retry the level or go to the next level if
    // they can
    void handleInput()
    {
        if(keyPressed && keys['R'])
        {
            failSoundPlayed = false;
            winSoundPlayed = false;
            mapFailed = false;
            isGame = true;
			isMenu = false;
			isInstructions = false;
            playState = new PlayState(mapNumber, level);
            isOver = false;
            solidiersSpawned = 0;
            lvl1SolSpawned = 0;
            lvl2SolSpawned = 0;
            lvl3SolSpawned = 0;
            solidiersDead = 0;
            amountSpent = 0;
            amountEarned = 0;
            mapLayout.clear();
        }

        if(keyPressed && keys['N'] && !mapFailed)
        {
            failSoundPlayed = false;
            winSoundPlayed = false;
            isGame = true;
			isMenu = false;
			isInstructions = false;
            mapNumber++;
            level++;
            playState = new PlayState(mapNumber, level);
            isOver = false;
            mapLayout.clear();
        }
    }

    //play the failure sound
    void failSound()
    {
        if(!failSoundPlayed)
        {
            fail.rewind();
            fail.play();
            failSoundPlayed = true;
        }
    }

    //play the victory sound
    void winSound()
    {
        if(!winSoundPlayed)
        {
            win.rewind();
            win.play();
            winSoundPlayed = true;
        }
    }
}
