class PlayState extends GameObject implements State
{
    Ui ui;
    PlayState()
    {
        ui = new Ui();
    }

    void init()
    {}

    void update()
    {
        handleInput();
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

        if(buffActive) startBuffCounter();

        stroke(0);
        ui.update();
        ui.render();

        elapsed++;
        solSpawnTimer++;
    }

    void render()
    {
        background(0, 128, 0);
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
        ui.update();
        ui.render();
    }

    void handleInput()
    {
        ui.checkUIButtonPressed();
        ui.checkUIKeyPressed();
    }

    void startBuffCounter()
    {
        buffTimer++;
    }
}
