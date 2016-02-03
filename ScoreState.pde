//TODO Make a fancy Score Screen for the user to see the stuff
class ScoreState extends GameObject implements State
{

    int solidiersSpawned;
    int lvl1SolSpawned;
    int lvl2SolSpawned;
    int lvl3SolSpawned;
    int solidiersDead;
    int amountSpent;
    int amountEarned;

    int textSize;
    color backgroundColour;
    color textColour;

    boolean mapFailed;

    int mapNumber;
    int level;

    boolean winSoundPlayed;
    boolean failSoundPlayed;

    AudioPlayer fail;
    AudioPlayer win;

    ScoreState()
    {
        // this.audio = audio;

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

        mapNumber = 1;
        level = 1;

        winSoundPlayed = false;
        failSoundPlayed = false;

        fail = minim.loadFile("failure.wav");
        win = minim.loadFile("victory.wav");
    }

    void update()
    {
        handleInput();
    }

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
            text("A glourious victory for the resistance", width / 2, 50);
            text("Press R to try and beat your score", width / 2, height / 2);
            text("Press N to go to the Next Map", width / 2, (height / 2) + 50);
        }

    }

    void handleInput()
    {
        // println("method called");
        if(keyPressed && keys['R'])
        {
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
            failSoundPlayed = false;
            winSoundPlayed = false;
            mapLayout.clear();
        }

        if(keyPressed && keys['N'] && !mapFailed)
        {
            isGame = true;
			isMenu = false;
			isInstructions = false;
            mapNumber++;
            level++;
            playState = new PlayState(mapNumber, level);
            isOver = false;
            failSoundPlayed = false;
            winSoundPlayed = false;
            mapLayout.clear();
        }
    }

    void failSound()
    {
        if(!failSoundPlayed)
        {
            fail.rewind();
            fail.play();
            failSoundPlayed = true;
        }
    }

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
