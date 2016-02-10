// Second level of tower
class SquareTower extends Battlements
{
    SquareTower(int level, float xRatio, float yRatio)
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
        attack = 9 * level;
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
        health = 175 * level;
    }
}
