public class Game {
     private String name;
    private int happinessIncrease;
    private int weightDecrease;
    private double chance;
    public Game(String name, int happinessIncrease, int weightDecrease, double chance){
        this.name = name;
        this.happinessIncrease = happinessIncrease;
        this.weightDecrease = weightDecrease;
        this.chance = chance;    }
    
    public String getName(){
        return name;
    }
    
    public int getHappinessIncrease(){
        return happinessIncrease;
    }
    
    public int getWeightDecrease(){
        return weightDecrease;
    }
    
    public boolean isWinner(){
        return Math.random() < chance;
    }
}
