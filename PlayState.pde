// Game state or play state for the game
class PlayState extends GameObject implements State
{
    Ui ui;
    Map map;
    int mapNumber;
    int level;
    boolean newGame;
    int baseCost;
    int baseStartScore;
    int baseLevelBonus;

    AudioPlayer sound;

    PlayState()
    {
        ui = new Ui();
        map = new Map();
        mapNumber = 1;
        level = 1;
        newGame = true;
        attackB = new AttackBoost();
        blitz = new Blitz();
        baseCost = 100;
        baseStartScore = 1000;
        baseLevelBonus = 500;
    }

    PlayState(int level, int mapNumber)
    {
        ui = new Ui();
        map = new Map();
        this.mapNumber = mapNumber;
        this.level = level;
        newGame = true;
        attackB = new AttackBoost();
        blitz = new Blitz();
        baseCost = 100;
        baseStartScore = 1000;
        baseLevelBonus = 500;

        sound = minim.loadFile("towerhit.aiff");
    }


    void update()
    {
        // if it is a new game being started, reload everything for the map
        if(newGame)
        {
            background(0, 128, 0);
            gameObjects.add(map);
            map.init(mapNumber, level);
            gameObjects.add(blitz);
            gameObjects.add(attackB);
            playerScore = (mapNumber * baseStartScore) + ((level - 1) * baseLevelBonus) + scoreState.amountEarned;
            newGame = false;
            blitzActive = false;
            attackboostActive = false;
            buffActive = false;
            blitzAnimation = false;
            attackBAnimation = false;
            elapsed = 0;
            solSpawnTimer = 0;
        }
        else
        {
            // check the user input
            handleInput();
            // adds level 1 solidier
            // last three lines are for stats
            if(solidierLvl1Bought)
            {
                Solidier newSol = new LightSolidier();
                gameObjects.add(newSol);
                solidierLvl1Bought = false;
                playerScore -= newSol.cost;
                scoreState.amountSpent += 1 * baseCost;
                scoreState.solidiersSpawned ++;
                scoreState.lvl1SolSpawned ++;
            }

            //adds level 2 solidier
            // last three lines are for stats
            if(solidierLvl2Bought)
            {
                Solidier newSol = new MedSoilidier();
                gameObjects.add(newSol);
                solidierLvl2Bought = false;
                playerScore -= newSol.cost;
                scoreState.amountSpent += 2 * baseCost;
                scoreState.solidiersSpawned ++;
                scoreState.lvl2SolSpawned ++;
            }

            // adds level 3 solidier
            // last three lines are for stats
            if(solidierLvl3Bought)
            {
                Solidier newSol = new HeavySolidier();
                gameObjects.add(newSol);
                solidierLvl3Bought = false;
                playerScore -= newSol.cost;
                scoreState.amountSpent += 3 * baseCost;
                scoreState.solidiersSpawned ++;
                scoreState.lvl3SolSpawned ++;
            }

            // makes sure only one buff can be active at one time
            if(blitzActive)
            {
                buffActive = true;
            }

            if(attackboostActive)
            {
                buffActive = true;
            }

            //starts a counter for the buffs
            if(buffActive) startBuffCounter();

            stroke(0);

            elapsed++;
            solSpawnTimer++;
        }
    }

    void render()
    {
        background(0, 128, 0);


        int gameObjectsLeft = 0;
        int objectCounter = 0;
        for(int i = 0 ; i < gameObjects.size() ; i ++)
        {
            if(!(gameObjects.get(i) instanceof Solidier))
            {
                if(!(gameObjects.get(i) instanceof Battlements))
                {
                    gameObjectsLeft++;
                }
                objectCounter++;
            }

            if(gameObjects.get(i).isAlive)
            {
                gameObjects.get(i).update();
                gameObjects.get(i).render();
            }
            else
            {
                if(gameObjects.get(i) instanceof Battlements)
                {
                    battlementDie();
                    playerScore += gameObjects.get(i).reward;
                }
                gameObjects.remove(i);
            }


        }
        ui.update();
        ui.render();
        if(!newGame)
        {   //Success in beating the map
            if(gameObjectsLeft == gameObjects.size())
            {
                isOver = true;
                gameObjects.clear();
            }
            //Failed to complete the map
            if(objectCounter == gameObjects.size() && playerScore < 100)
            {
                isOver = true;
                gameObjects.clear();
                scoreState.mapFailed = true;
            }
        }

    }

    //Checks to see the input from the user
    void handleInput()
    {
        // Checks if the ui elements have been pressed
        ui.checkUIButtonPressed();
        ui.checkUIKeyPressed();
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
            //remove all the objects from the game
            gameObjects.clear();
            newGame = true;
            blitzActive = false;
			attackboostActive = false;
			buffActive = false;
		}
		else if(keys['I'])
		{
			isGame = false;
			isMenu = false;
			isInstructions = true;
		}
    }

    // counter for the buffs duration
    void startBuffCounter()
    {
        buffTimer++;
    }

    //plays a sound if a battlement dies
    void battlementDie()
    {
        sound.rewind();
        sound.play();
    }
}
