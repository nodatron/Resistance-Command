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

// Map map;
// Solidier ss;
//Setting the height of the map
float MAP_HEIGHT;

void setup()
{
	fullScreen();
	background(0, 128, 0);
	frameRate(60);
	MAP_HEIGHT = height * 0.9f;
	//NOTE: This will be replaced by input from the user as to which map they want
	utils.initMap(1, 1);
	// for(int i = 0 ; i < 5 ; i ++)
	// {
	// 	Solidier s = new Solidier();
	// 	gameObjects.add(s);
	// }
	Solidier s = new Solidier();
	gameObjects.add(s);


	blitz = new Blitz();
	gameObjects.add(blitz);
}

int elapsed = 0;

// boolean allowedMove;
Blitz blitz;
// int blitzTimer = 0;
// int attackBoostTimer = 0;
int buffTimer = 0;
boolean buffActive = false;

void draw()
{
	background(0, 128, 0);
	shape(currentlevel);
	//FIXME: This doesnt work when you remove stuff from the arraylist
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
	
	stroke(0);

	if (mouseY > MAP_HEIGHT && !buffActive && mouseX > width * 0.5f && mouseX < width * 0.6f)
	{
		// blitz.buff(solidier);
		println("Buff activated");
		buffActive = true;	
	}

	if(buffActive) startBuffCounter();

	if (mouseY > MAP_HEIGHT && !buffActive && mouseX < width * 0.5f)
	{
		// blitz.buff(solidier);
		println("Buff activated");
		buffActive = true;	
	}

	if(buffActive) startBuffCounter();

	elapsed++;
	
}

void startBuffCounter()
{
	buffTimer++;
	// blitzTimer++;
	// println("blitzTimer: "+blitzTimer);
}