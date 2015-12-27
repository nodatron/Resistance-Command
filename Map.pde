class Map 
{
	Battlements b;
	Map () 
	{
		b = new Battlements();
	}

	void init(int mapNo, int level)
	{
		switch (mapNo)
		{
			case 1:
			{
				String[] locations = loadStrings("map1.csv");

				for(String s : locations)
				{
					String[] ratios = s.split(",");
					float xRatio = Float.parseFloat(ratios[0]);
					float yRatio = Float.parseFloat(ratios[1]);
					Battlements tower = new Battlements(level, xRatio, yRatio);
					battlements.add(tower);
				}
			} break;

			// case 2:
			// {
			// 	String[] locations = loadStrings("map2.csv");

			// 	for(String s : locations)
			// 	{
			// 		String ratios = s.split(",");
			// 		Battlement tower = new Battlement(level, ratios[0], ratios[1]);
			// 		battlements.add(tower);
			// 	}
			// } break;

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
}