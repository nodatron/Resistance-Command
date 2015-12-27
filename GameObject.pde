abstract class GameObject
{
	//Stats
	int level;
	int health;
	int armour;
	int cost;
	int reward;

	//Position stuff
	PVector position;
	PVector goalPosition;
	PVector distance;
	PVector speed;

	//Apperance   -replaced by sprites later
	float spriteWidth;
	float spriteHeight;
	color spriteColour;

	GameObject ()
	{
		this(1);
	}

	GameObject (int level)
	{
		this.level = level;
		health = level * 100;
		armour = level * 5;
		cost = level * 500;
		reward = cost / 2;
		position = new PVector();
		goalPosition = new PVector();
		distance = new PVector();
		speed = new PVector();
		spriteWidth = width * 0.04f;
		spriteHeight = height * 0.04f;
	}

	abstract void init();
	abstract void update();
	abstract void render();
}