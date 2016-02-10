// The middle class of solidier
class MedSoilidier extends Solidier
{

    MedSoilidier()
    {
        super(2);
        getAttackDamage();
        getHealth();
        getArmour();
        getCost();
        reward = cost / 2;
        sprite = loadImage("solidier2.png");
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
