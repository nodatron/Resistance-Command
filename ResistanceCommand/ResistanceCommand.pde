/*
	All music for the game was taken from freesound.org
	Game requires minim to be installed
*/

import ddf.minim.*;

//used for sound
Minim minim;

ArrayList<PVector> mapLayout = new ArrayList<PVector>();
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
//end point for the solidiers to reach each level
PVector endPoint;

float MAP_HEIGHT;
//Player Score in the game
int playerScore = 1000;
//boolean to see if the level is over
boolean isOver = false;

PlayState playState;
MenuState menuState;
SplashState splashState;
ScoreState scoreState;

//boolean variables for buying solidiers
boolean solidierLvl1Bought = false;
boolean solidierLvl2Bought = false;
boolean solidierLvl3Bought = false;
boolean canAffordSolidierLvl1 = true;
boolean canAffordSolidierLvl2 = true;
boolean canAffordSolidierLvl3 = true;

//counters for solidier spawning and firing
int elapsed = 0;
int solSpawnTimer = 0;

// Variables for powerups
Blitz blitz;
AttackBoost attackB;
boolean attackboostActive = false;
boolean blitzActive = false;
int buffTimer = 0;
boolean buffActive = false;
boolean blitzAnimation = false;
boolean attackBAnimation = false;

//state variables
boolean isMenu = true;
boolean isGame = false;
boolean isInstructions = false;

boolean[] keys = new boolean[512];

void setup()
{
	fullScreen();
	frameRate(60);
  	minim = new Minim(this);

	MAP_HEIGHT = height * 0.9f;
	menuState = new MenuState();
	playState = new PlayState(1, 1);
	scoreState = new ScoreState();
	splashState = new SplashState();
}



void keyPressed()
{
	keys[keyCode] = true;
}

void keyReleased()
{
	keys[keyCode] = false;
}


void draw()
{
	// level is complete
	if(isGame && isOver && elapsed > 10)
	{
		scoreState.update();
		scoreState.render();
	}
	else
	{
		//show the starting menu
		if(isMenu)
		{
			splashState.update();
			splashState.render();
		}
		//show the game screen
		else if(isGame)
		{
			playState.update();
			playState.render();
		}
		//show the controls
		else if (isInstructions)
		{
			menuState.update();
			menuState.render();
		}
	}
}
