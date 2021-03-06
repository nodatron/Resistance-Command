//Higgest level of battlement on the game
class Fort extends Battlements
{
    Fort(int level, float xRatio, float yRatio)
    {
        super(3, xRatio, yRatio);
        getAttackDamage();
        getArmour();
        getReward();
        getHealth();
        sprite = loadImage("fort.png");
    }

    void getAttackDamage()
    {
        attack = 14 * level;
    }

    void getArmour()
    {
        armour = 7 * level;
    }

    void getReward()
    {
        reward = 300 * level;
    }

    void getHealth()
    {
        health = 200 * level;
    }
}
