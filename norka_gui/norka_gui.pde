nPanel mainPanel;

void setup() {
  size(400, 400);
  background(255);
  mainPanel = new nPanel();
  nButton test = new nButton("test", 175, 175, 50, 50);
  nButton test2 = new nButton("test2", 0, 0, 20, 20);
  test.setLabel("test");
  test.showLabel();
  mainPanel.addElement(test);
  mainPanel.addElement(test2);
  //mainPanel.display();
}

void draw() {
  clear();
  background(255);
  mainPanel.update();
  //println(mainPanel.getAction());
  mainPanel.display();
}

//Old_Testing
/*
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
 //main.showPanel(); //Unnecessary, panel visible by default
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
 //main.hidePanel();
 } else {
 background(255, 0, 0);
 buttonState = 0;
 //main.showPanel();
 }
 } else if (main.getAction().equals("bark-MOUSE_CLICK") || main.getAction().equals("bark-KEY_CLICK")) {
 background(0, 255, 0);
 } else if (main.getAction().equals("bark-MOUSE_HOVER")) {
 background(0, 0, 255);
 }
 main.display();
 }
 */