class Fort extends Battlements
{


    Fort(int level, float xRatio, float yRatio)
    {
        super(3, xRatio, yRatio);
        getAttackDamage();
        getArmour();
        getReward();
        getHealth();
        sprite = loadImage("battlement.png");
    }

    void getAttackDamage()
    {
        attack = 12 * level;
    }

    void getArmour()
    {
        armour = 7 * level;
    }

    void getReward()
    {
        reward = 200 * level;
    }

    void getHealth()
    {
        health = 300 * level;
    }
}
