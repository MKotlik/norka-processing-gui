nPanel main;
int buttonState;
void setup() {
  size(400, 400);
  buttonState = 0;
  main = new nPanel();
  TestButton test = new TestButton("test", 200, 200, 50, 50);
  main.addElement(test);
  main.showPanel();
  main.update();
  main.display();
}


void draw() {
  if (keyPressed) {
    println(key);
  }
  main.update();
  if (main.getAction().equals("test-MOUSE_PRESS") || main.getAction().equals("test-KEY_PRESS")) {
    if (buttonState == 0) {
      background(0);
      buttonState = 1;
    } else {
      background(255, 0, 0);
      buttonState = 0;
    }
  }
  main.display();
}