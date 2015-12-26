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
	PVector speed;

	//Apperance   -replaced by sprites later
	float spriteWidth;
	float spriteHeight;
	color spriteColor;

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
		reward = cost * 0.5f;
		position = new PVector();
		goalPosition = new PVector();
		speed = new PVector();
		spriteWidth = 50;
		spriteHeight = 50;
	}

	abstract void init();
	abstract void update();
	abstract void render();
}