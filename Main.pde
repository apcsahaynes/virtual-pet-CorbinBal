VirtualPet myPet;
ArrayList<Game> games;
Button feedButton;
Button playButton;
Button fartButton;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 16, true));

  myPet = new VirtualPet("Coco");
  games = new ArrayList<>();
  games.add(new Game("coin toss", 3, 3, 0.5));
  games.add(new Game("zelda", 5, 1, 1.0));
  //games.add(new Game("roll in grass", )
  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 100, 430, 120, 45);
  playButton = new Button("Play", 240, 430, 120, 45);
  fartButton = new Button("Fart", 380, 430, 120, 45);
}

void draw() {
  background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  playButton.display();
  fartButton.display();
  drawMessage();
}

void mousePressed() {
  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Watermelon", 3, -2, 2);
    myPet.feed(f);
    showMessage(f.getName() + " eaten!");
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = games.get((int)random(0,2));
    myPet.play(g);
    showMessage(g.getName() + " played!");
  }
  
  if (fartButton.isClicked(mouseX, mouseY)) {
    if(myPet.getIsFull() == true){
      showMessage("Eww");
    } else{
      showMessage("Try again later");
    }
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
