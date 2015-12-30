//TODO(30/12/2015) 	1. Move the stuff from the map class into the utils class becuase it doesnt make sense to have a map class   DONE
//					2. Make the Solidiers move in the way of the map
//					3. Make the battlements fire at the solidiers.
//					4. Make collision detection for the solidiers and the battlements
//   				5. Make the damage from the towers get effected by the armour of the solidiers and do the same for the solidiers being hit by the battlements
//					6. Make the powerups for the solidiers
//						ideas: speed boost, armour boost, all heal, barrage on towers, 
//					7. Make a score go up for every solidier that goes through the last point of the game
//					8. Make the sprites for the game i.e. foot solidier, knight, battering ram, archer tower, catapult tower, balista tower
//					9. Make the splash screen for the game and make it look awesome
//					10. Add in diffiulty if i have the time (pussy, filthy casual and true gamer who sees no sunlight)
//					11.Optimize the game of there is a need to
//NOTE:  Try to break the fucking game as much as possible


// Used for util functions throughout the game
RCUtils utils = new RCUtils();

ArrayList<PVector> mapLayout = new ArrayList<PVector>();

ArrayList<Battlements> battlements = new ArrayList<Battlements>();

PShape currentlevel;

Solidier solidier;
Map map;

void setup()
{
	fullScreen();
	background(0, 128, 0);
	frameRate(90);
	
	map = new Map();
	//NOTE: This will be replaced by input from the user as to which map they want
	// map.init(1, 1);
	utils.initMap(1, 1);
	solidier =  new Solidier();

}

void draw()
{
	background(0, 128, 0);
	shape(currentlevel);
	solidier.render();
	solidier.update();
	for (Battlements b : battlements) 
	{
		b.render();
		b.update();
	}
}