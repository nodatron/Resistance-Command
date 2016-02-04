// Higgest level of solidier the user can buy
class HeavySolidier extends Solidier
{
    HeavySolidier()
    {
        super(3);
        getAttackDamage();
        getHealth();
        getArmour();
        getCost();
        reward = cost / 2;
        sprite = loadImage("solidier3.png");
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
