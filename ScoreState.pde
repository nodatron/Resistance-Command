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

    ScoreState()
    {
        solidiersSpawned = 0;
        lvl1SolSpawned = 0;
        lvl2SolSpawned = 0;
        lvl3SolSpawned = 0;
        solidiersDead = 0;
        amountSpent = 0;
        amountEarned = 0;
    }

    void init()
    {
    }

    void update()
    {
        handleInput();
    }

    void render()
    {
        text("Solidiers Spawned: " + solidiersSpawned, 100, 100);
        text("Level 1 Solidiers spawned: " + lvl1SolSpawned, 100, 150);
        text("Level 2 Solidiers spawned: " + lvl2SolSpawned, 100, 200);
        text("Level 3 Solidiers spawned: " + lvl3SolSpawned, 100, 250);
        text("Soliders Dead: " + solidiersDead, 100, 300);
        text("Amount Spent: " + amountSpent, 100, 350);
        text("Amount Earned: " + amountEarned, 100, 400);
    }

    void handleInput()
    {
        // println("method called");
        if(keyPressed && keys['R'])
        {
            println("Resetting");
            isGame = true;
			isMenu = false;
			isInstructions = false;
            playState = new PlayState();
            playState.mapNumber = 1;
            playState.level = 1;
            isOver = false;
            solidiersSpawned = 0;
            lvl1SolSpawned = 0;
            lvl2SolSpawned = 0;
            lvl3SolSpawned = 0;
            solidiersDead = 0;
            amountSpent = 0;
            amountEarned = 0;
            playerScore = 1000 * playState.mapNumber + (500 * (playState.level - 1));
        }

        if(keyPressed && keys['N'])
        {
            isGame = true;
			isMenu = false;
			isInstructions = false;
            playState = new PlayState();
            playState.mapNumber ++;
            playState.level ++;
            isOver = false;
            playerScore += 1000 * playState.mapNumber + (500 * (playState.level - 1));
        }
    }
}
