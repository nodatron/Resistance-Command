//TODO(30/12/2015) 	1. Move the stuff from the map class into the utils class becuase it doesnt make sense to have a map class   DONE
//					2. Make the Solidiers move in the way of the map   DONE
//					3. Make the battlements fire at the solidiers.	DONE
//					4. Make collision detection for the solidiers and the battlements	DONE
//   				5. Make the damage from the towers get effected by the armour of the solidiers and do the same for the solidiers being hit
//					by the battlements	DONE
//					6. Make the powerups for the Solidiers
//						ideas: speed boost, armour boost, all heal, barrage on towers, 				SOME ARE DONE
//					7. Make a score go up for every solidier that goes through the last point of the game
//					8. Make the sprites for the game i.e. foot solidier, knight, battering ram, archer tower, catapult tower, balista tower 	DONE
//					9. Make the splash screen for the game and make it look awesome		DONE
//					10. Add in diffiulty if i have the time
//					11. Optimize the game of there is a need to


//					12. Make the buttons for the spawning of the units
//					13. Player can use keys to spawn the units and the buffs
//					14. Add the battlement image to the game
//					15. Make the battlements take damage from the user when they are hit
//					16. Make a healthbar or some visual queue come up for the health for the solidiers and the battlements
//NOTE:  Try to break the fucking game as much as possible

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
