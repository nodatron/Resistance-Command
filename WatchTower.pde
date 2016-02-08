// weakest tower in game
class WatchTower extends Battlements
{
    WatchTower(int level, float xRatio, float yRatio)
    {
        super(level, xRatio, yRatio);
        getAttackDamage();
        getArmour();
        getReward();
        getHealth();
        sprite = loadImage("watchtower.png");
    }

    void getAttackDamage()
    {
        attack = 5 * level;
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
        health = 200 * level;
    }

}
