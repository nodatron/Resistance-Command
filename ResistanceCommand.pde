//FIXME: Some weird bug with the solidiers refusing to move when you activate the blitz buff at a certain time
//FIXME: First map the solidiers are not going the full way to the end of the map
//FIXME: Collsion with the battlements and solidiers is recognised but the solidiers still continue

//TODO(30/12/2015) 	1. Move the stuff from the map class into the utils class becuase it doesnt make sense to have a map class   DONE
//					2. Make the Solidiers move in the way of the map   DONE
//					3. Make the battlements fire at the solidiers.	DONE
//					4. Make collision detection for the solidiers and the battlements	MOSTLY DONE
//   				5. Make the damage from the towers get effected by the armour of the solidiers and do the same for the solidiers being hit
//					by the battlements	DONE
//					6. Make the powerups for the Solidiers
//						ideas: speed boost, armour boost, all heal, barrage on towers, 				SOME ARE DONE
//					7. Make a score go up for every solidier that goes through the last point of the game
//					8. Make the sprites for the game i.e. foot solidier, knight, battering ram, archer tower, catapult tower, balista tower
//					9. Make the splash screen for the game and make it look awesome
//					10. Add in diffiulty if i have the time
//					11. Optimize the game of there is a need to


//					12. Make the buttons for the spawning of the units
//					13. Player can use keys to spawn the units and the buffs
//					14. Add the battlement image to the game
//					15. Make the battlements take damage from the user when they are hit
//					16. Make a healthbar or some visual queue come up for the health for the solidiers and the battlements
//NOTE:  Try to break the fucking game as much as possible


/**************
NOTE: To make the deletion of the objects work i need to create an arraylist of just GameObjects
		Need to have a way of checking if a solidier, bullet or battlement is dead
		If the are dead i.e. live = 0 or they have gone offscreen
		In draw() i check if the object is Alive, if it is then draw and update it
		if not then get rid of the object
********************/



// Used for util functions throughout the game
RCUtils utils = new RCUtils();

ArrayList<PVector> mapLayout = new ArrayList<PVector>();

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

PShape currentlevel;
PVector endPoint;

//Setting the height of the map
float MAP_HEIGHT;

void setup()
{
	fullScreen();
	frameRate(60);
	MAP_HEIGHT = height * 0.9f;
	//NOTE: This will be replaced by input from the user as to which map they want
	//NOTE: This will have to be moved
	utils.initMap(1, 1);
	// for(int i = 0 ; i < 5 ; i ++)
	// {
	// 	Solidier s = new Solidier();
	// 	gameObjects.add(s);
	// }
	Solidier s = new Solidier();
	gameObjects.add(s);
	ui = new Ui();

	blitz = new Blitz();
	// gameObjects.add(blitz);
	menu = new Menu();
	menu.update();
	menu.render();
}

Ui ui;
Menu menu;
Instructions instruct = new Instructions();

boolean solidierLvl1Bought = false;
boolean solidierLvl2Bought = false;
boolean solidierLvl3Bought = false;

boolean canAffordSolidierLvl1 = false;
boolean canAffordSolidierLvl2 = false;
boolean canAffordSolidierLvl3 = false;

int elapsed = 0;
int solSpawnTimer = 0;

// boolean allowedMove;
Blitz blitz;
boolean attackboostActive = false;
boolean blitzActive = false;
int buffTimer = 0;
boolean buffActive = false;

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
	utils.checkKeys();
	utils.checkMode();
}
