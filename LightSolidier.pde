class LightSolidier extends Solidier
{

    LightSolidier()
    {
        super(1);
        getAttackDamage();
        getHealth();
        getArmour();
        getCost();
        reward = cost / 2;
        sprite = loadImage("solidier.png");
    }

    void getAttackDamage()
    {
        attack = 10 * level;
    }

    void getHealth()
    {
        health = 100 * level;
    }

    void getArmour()
    {
        armour = 4 * level;
    }

    void getCost()
    {
        cost = 100 * level;
    }
}
