class Instructions 
{
	color backgroundColour;
	color textColour;
	color tableColour;

	int titleTextSize;
	int tableHeaderSize;
	int tableTextSize;
	int numRows;

	PVector tablePos;
	float cellWidth;
	float cellHeight;

	void init()
	{
		numRows = 10; 

		titleTextSize = 64;
		tableHeaderSize = 48;
		tableTextSize = 32;

		tablePos = new PVector(width * 0.25f, height * 0.25f);
		cellWidth = tablePos.x * 2.0f;
		cellHeight = ((height * 0.5f) / (float) numRows);

		tableColour = color(194, 209, 240);
		textColour = color(235, 240, 250);
		backgroundColour = color(0, 0, 26);
	}

	void render()
	{
		background(backgroundColour);
		noFill();
		stroke(tableColour);
		rect(tablePos.x, tablePos.y,
			 width * 0.5f, height *0.5f);
		for (int i = 1 ; i < numRows ; i ++)
		{
			line(tablePos.x, tablePos.y + ((float) i * cellHeight), 
				 width - tablePos.x, tablePos.y + ((float) i * cellHeight));
		}
		line(tablePos.x + cellWidth, tablePos.y,
			 tablePos.x + cellWidth, height - tablePos.y);
	}
}