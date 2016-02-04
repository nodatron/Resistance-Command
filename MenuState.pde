// Menu state NOTE should change to instruction state
class MenuState extends GameObject implements State
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
	float halfCellHeight;
	float textXPosButton;
	float textXPosFunction;



    MenuState()
    {
        numRows = 10;

		titleTextSize = 64;
		tableHeaderSize = 48;
		tableTextSize = 26;

		tablePos = new PVector(width * 0.25f, height * 0.25f);
		cellWidth = tablePos.x * 2.0f;
		cellHeight = ((height * 0.5f) / (float) numRows);
		halfCellHeight = cellHeight * 0.5f;
		textXPosButton = cellWidth - (tablePos.x * 0.5f);
		textXPosFunction = cellWidth + (tablePos.x * 0.5f);

		tableColour = color(194, 209, 240);
		textColour = color(235, 240, 250);
		backgroundColour = color(0, 0, 26);
    }

    // checks for input from the user
    void update()
    {
        handleInput();
    }

    // draws the boxes and lists of controls
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
		line(cellWidth, tablePos.y,
			 cellWidth, height - tablePos.y);

		fill(textColour);
		textSize(tableHeaderSize);
		text("Button", textXPosButton, tablePos.y + halfCellHeight);
		text("Function", textXPosFunction, tablePos.y + halfCellHeight);
		textSize(tableTextSize);
		text("S", textXPosButton, tablePos.y + (cellHeight * 2.0f) + halfCellHeight);
		text("Spawns a solidier at the highest level",
			 textXPosFunction, tablePos.y + (cellHeight * 2.0f) + halfCellHeight);

		text("1", textXPosButton, tablePos.y + (cellHeight * 3.0f) + halfCellHeight);
		text("Spawns a level one solidier",
			 textXPosFunction, tablePos.y + (cellHeight * 3.0f) + halfCellHeight);

		text("2", textXPosButton, tablePos.y + (cellHeight * 4.0f) + halfCellHeight);
		text("Spawns a level 2 solidier",
			 textXPosFunction, tablePos.y + (cellHeight * 4.0f) + halfCellHeight);

		text("3", textXPosButton, tablePos.y + (cellHeight * 5.0f) + halfCellHeight);
		text("Spawns a level 3 solidier",
			 textXPosFunction, tablePos.y + (cellHeight * 5.0f) + halfCellHeight);

		text("M", textXPosButton, tablePos.y + (cellHeight * 6.0f) + halfCellHeight);
		text("Back to menu",
			 textXPosFunction, tablePos.y + (cellHeight * 6.0f) + halfCellHeight);

		text("B", textXPosButton, tablePos.y + (cellHeight * 7.0f) + halfCellHeight);
		text("Activate the blitz powerup",
			 textXPosFunction, tablePos.y + (cellHeight * 7.0f) + halfCellHeight);

		text("A", textXPosButton, tablePos.y + (cellHeight * 8.0f) + halfCellHeight);
		text("Activate the attack boost powerup",
			 textXPosFunction, tablePos.y + (cellHeight * 8.0f) + halfCellHeight);

		text("H", textXPosButton, tablePos.y + (cellHeight * 9.0f) + halfCellHeight);
		text("Fully heal all the ally units",
			 textXPosFunction, tablePos.y + (cellHeight * 9.0f) + halfCellHeight);
    }

    // checks for user input
    void handleInput()
    {
    	// go to game
        if(keys['P'])
		{
			isGame = true;
			isMenu = false;
			isInstructions = false;
		}
		// go to the splash screen
		else if(keys['M'])
		{
			isGame = false;
			isMenu = true;
			isInstructions = false;
		}
		//Stay on the same state
		else if(keys['I'])
		{
			isGame = false;
			isMenu = false;
			isInstructions = true;
		}
    }


}
