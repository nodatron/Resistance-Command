//Gets the information for the map
class Map extends GameObject
{
	PShape currentlevel;
	String[] locations;

	Map ()
	{
	}

	//get the data for the map
	void init(int mapNo, int level)
	{
		// Selects the map
		switch (mapNo)
		{
			case 1:
			{
				locations = loadStrings("map1.txt");
			} break;

			case 2:
			{
				locations = loadStrings("map2.txt");
			} break;

			case 3:
			{
				locations = loadStrings("map3.txt");
			} break;
		}
		// Gets the location of all the points for the map
		for(String s : locations)
		{
			String[] lines = s.split(",");
			float xRatio = Float.parseFloat(lines[1]);
			float yRatio = Float.parseFloat(lines[2]);
			// first part of each line has a word for what it is
			// checks the word and does the appropriate action
			if (lines[0].equals("battlement"))
			{
				chooseTower(level, xRatio, yRatio);
			}
			else if(lines[0].equals("endpoint"))
			{
				endPoint = new PVector(width * xRatio, height  * yRatio);
			}
			else
			{
				PVector point = new PVector(width * xRatio, height  * yRatio);
				mapLayout.add(point);
			}
		}

		//creates a shape for the map, if not the game runs at like 2fps
		currentlevel = createShape();
		currentlevel.beginShape();
		currentlevel.fill(153, 75, 0);
		currentlevel.stroke(153, 75, 0);
		for (int i = 0 ; i < mapLayout.size() ; i ++)
		{
			currentlevel.vertex(mapLayout.get(i).x, mapLayout.get(i).y);
		}
		currentlevel.endShape(CLOSE);
	}

	void update()
	{
	}

	void render()
	{
		// draw the map
		shape(currentlevel);
	}

	void chooseTower(int level, float xRatio, float yRatio)
	{
		//choose which tower
		switch(level)
		{
			case 1:
			{
				Battlements tower = new WatchTower(level, xRatio, yRatio);
				gameObjects.add(tower);
			} break;

			case 2:
			{
				Battlements tower = new SquareTower(level, xRatio, yRatio);
				gameObjects.add(tower);
			} break;

			case 3:
			{
				Battlements tower = new Fort(level, xRatio, yRatio);
				gameObjects.add(tower);
			} break;
		}
	}
}
