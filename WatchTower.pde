class WatchTower extends Battlements
{
    WatchTower(int level, float xRatio, float yRatio)
    {
        super(level, xRatio, yRatio);
        getAttackDamage();
        getArmour();
        getReward();
        getHealth();
        sprite = loadImage("battlement.png");
    }

    void getAttackDamage()
    {
        attack = 20 * level;
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
