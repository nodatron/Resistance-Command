abstract class GameObject
{
	//Stats
	int level;
	int health;
	int armour;
	int cost;
	int reward;
	int attack;
	boolean isAlive;

	//Position stuff
	PVector position;
	PVector goalPosition;
	PVector forward;
	PVector speed;
	float theta;

	//Apperance   -replaced by sprites later
	PImage sprite;
	float spriteWidth;
	float spriteHeight;
	color spriteColour;

  AudioPlayer hitSound;
  
	//for the powerups
	float itint;

	GameObject ()
	{
		this(1);
	}

	GameObject (int level)
	{
		this.level = level;
		health = level * 100;
		armour = level * 5;
		cost = level * 100;
		reward = cost / 2;
		attack = 10;
		isAlive = true;
		position = new PVector();
		goalPosition = new PVector();
		forward = new PVector();
		theta = 0.0f;
		speed = new PVector();
		spriteWidth = width * 0.04f;
		spriteHeight = height  * 0.04f;
		itint = 0;
	}

	// abstract void init();
	abstract void update();
	abstract void render();
}