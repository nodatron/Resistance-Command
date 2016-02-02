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

    PlayState()
    {
        ui = new Ui();
        map = new Map();
        mapNumber = 2;
        level = 1;
        newGame = true;
        attackB = new AttackBoost();
        blitz = new Blitz();
        baseCost = 100;
        baseStartScore = 1000;
        baseLevelBonus = 500;
    }

    void init()
    {}

    void update()
    {
        //TODO if they come from the splash screen to game mode then reload everything into the game
        if(newGame)
        {
            gameObjects.add(map);
            map.init(mapNumber, level);
            gameObjects.add(blitz);
            gameObjects.add(attackB);
            playerScore = (mapNumber * baseStartScore) + ((level - 1) * baseLevelBonus);
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
            handleInput();
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

            if(blitzActive)
            {
                buffActive = true;
            }

            if(attackboostActive)
            {
                buffActive = true;
            }

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
                gameObjects.remove(i);
            }


        }
        ui.update();
        ui.render();
        if(!newGame)
        {//Success in beating the map
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

    void handleInput()
    {
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

    void startBuffCounter()
    {
        buffTimer++;
    }
}
