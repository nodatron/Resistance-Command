//TODO: Move this entire class to the utlis class as the stuff in this class has nothing to do with a map
class Map extends GameObject
{
	PShape currentlevel;
	Map ()
	{}
	void init()
	{}
	//NOTE: This could be a map class
	void init(int mapNo, int level)
	{
		// Selects which map that the user wants
		switch (mapNo)
		{
			case 1:
			{
				String[] locations = loadStrings("map1.txt");

				for(String s : locations)
				{
					String[] lines = s.split(",");
					float xRatio = Float.parseFloat(lines[1]);
					float yRatio = Float.parseFloat(lines[2]);
					if (lines[0].equals("battlement"))
					{
						Battlements tower = new Battlements(level, xRatio, yRatio);
						gameObjects.add(tower);
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

				currentlevel = createShape();
				currentlevel.beginShape();
				currentlevel.fill(153, 75, 0);
				currentlevel.stroke(153, 75, 0);
				for (int i = 0 ; i < mapLayout.size() ; i ++)
				{
					currentlevel.vertex(mapLayout.get(i).x, mapLayout.get(i).y);
				}
				currentlevel.endShape(CLOSE);
			} break;

			case 2:
			{
				String[] locations = loadStrings("map2.txt");

				for(String s : locations)
				{
					String[] lines = s.split(",");
					float xRatio = Float.parseFloat(lines[1]);
					float yRatio = Float.parseFloat(lines[2]);
					if (lines[0].equals("battlement"))
					{
						Battlements tower = new Battlements(level, xRatio, yRatio);
						gameObjects.add(tower);
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

				currentlevel = createShape();
				currentlevel.beginShape();
				currentlevel.fill(153, 75, 0);
				currentlevel.stroke(153, 75, 0);
				for (int i = 0 ; i < mapLayout.size() ; i ++)
				{
					currentlevel.vertex(mapLayout.get(i).x, mapLayout.get(i).y);
				}
				currentlevel.endShape(CLOSE);
			} break;

			// case 3:
			// {
			// 	String[] locations = loadStrings("map3.csv");

			// 	for(String s : locations)
			// 	{
			// 		String ratios = s.split(",");
			// 		Battlement tower = new Battlement(level, ratios[0], ratios[1]);
			// 		battlements.add(tower);
			// 	}
			// } break;
		}
	}

	void update()
	{
	}

	void render()
	{
		/*TODO:		Take the location of the turrets and draw a map arounf the battlements
					HOW I WILL DO THIS:
					1. Take the values of the locations and add a distance around them that is determined from the level of the towers
					2. Make roads from these points that i can use to make the roads the solidiers will walk along
					3. Make the are around the roads green for now
					TODO: come up with some sort of graphic for the are outside the roads			-PROB a Castle
					4. Make these roads the borders for the solidiers
		*/
		shape(currentlevel);

	}
}
