/*TODO(13/02/16)
	Get the sounds from the web and use them in the game
	Make sure that the buff icons will light up when they are activated
	Balance the game so that the player can get through the game without losing every single time
		-change the health of the units
		-change the damage of the projectiles and the towers
		-change the range and the fire rate of the towers
	Make the new sprites for the 2 other types of battlements
	Comment all the code
	Added references to the music makers
	commit the game to git and leave it alone forever

	Credits
	DaleT92 - freesound
	CastIronCarousel
	chripei
	GabrielAraujo
	inchadney
	cormi
	Setuniman
	Kyster
	Timbre
	Under7dude
*/

// FIXME(2/7/2016)
/*
	*the powerups dont change alpha when they are activated
	*Make the sprite for the WatchTower and square tower
	*On the last level the retry doesnt work
	*Fix the balance of the game
	*Killing a battlement doesnt give any score when it should
	*MAKE SURE TO CHECK IF YOU HAVE TO DO SCREENSHOTS OF THE GAME
*/

//TODO(31/1/16) : Show the players score when plating the game
//				: Make the score go down when a unit is bought
//				: Make the boolean variables true or false based on whether the unit can be bought
//				: Make half the cost of the units be addded to the score when they make it to the end of the map
//				: At the end of the game show a screen with score on it aswell as solidiers bought, how many at what level, score spent
//				: This could probably be a new state callled ScoreState

//FIXME(31/1/16) : Powerups should not be allowed activate if another powerup is active
//				 : Add and option for the user to make sure they want to quit from the game to the menu

//FIXME: The animation for the buffs does not display after the first map is retried
//FIXME: When you go from game to main menu back to game it thinks you have won the game
//		Need to reset the score and all variables in scorestate when this is done

// Used for util functions throughout the game
// RCUtils utils = new RCUtils();

import ddf.minim.*;

Minim minim;
AudioPlayer music;
// Audio audio;

ArrayList<PVector> mapLayout = new ArrayList<PVector>();
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

// PShape currentlevel;
PVector endPoint;

//Setting the height of the map
float MAP_HEIGHT;

long playerScore = 1000;

void setup()
{
	fullScreen();
	frameRate(60);
  	minim = new Minim(this);
	// audio = new Audio(minim);
	MAP_HEIGHT = height * 0.9f;
	menuState = new MenuState();
	scoreState = new ScoreState();
	playState = new PlayState(1, 1);
	splashState = new SplashState();
}

boolean isOver = false;

PlayState playState;
MenuState menuState;
SplashState splashState;
ScoreState scoreState;

boolean solidierLvl1Bought = false;
boolean solidierLvl2Bought = false;
boolean solidierLvl3Bought = false;

boolean canAffordSolidierLvl1 = true;
boolean canAffordSolidierLvl2 = true;
boolean canAffordSolidierLvl3 = true;

int elapsed = 0;
int solSpawnTimer = 0;

Blitz blitz;
AttackBoost attackB;
boolean attackboostActive = false;
boolean blitzActive = false;
int buffTimer = 0;
boolean buffActive = false;
boolean blitzAnimation = false;
boolean attackBAnimation = false;

boolean isMenu = true;
boolean isGame = false;
boolean isInstructions = false;
boolean[] keys = new boolean[512];

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
	if(isGame && isOver && elapsed > 10)
	{
		scoreState.update();
		scoreState.render();
	}
	else
	{
		if(isMenu)
		{
			splashState.update();
			splashState.render();
		}
		else if(isGame)
		{
			playState.update();
			playState.render();
		}
		else if (isInstructions)
		{
			menuState.update();
			menuState.render();
		}
	}
	// println("Player Score " + playerScore);
}
