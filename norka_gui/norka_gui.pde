nPanel main;
int buttonState;
void setup() {
  size(400, 400);
  buttonState = 0;
  main = new nPanel();
  TestButton test = new TestButton("test", 200, 200, 50, 50);
  TestButton bark = new TestButton("bark", 150, 150, 20, 20);
  bark.setKeyBind('u');
  main.addElement(test);
  main.addElement(bark);
  main.showPanel();
}


void draw() {
  if (keyPressed) {
    println(key);
  }
  println(main.getAction());
  main.update();
  if (main.getAction().equals("test-MOUSE_CLICK") || main.getAction().equals("test-KEY_CLICK")) {
    if (buttonState == 0) {
      background(0);
      buttonState = 1;
    } else {
      background(255, 0, 0);
      buttonState = 0;
    }
  } else if (main.getAction().equals("bark-MOUSE_CLICK") || main.getAction().equals("bark-KEY_CLICK")) {
    background(0, 255, 0);
  }
  main.display();
}