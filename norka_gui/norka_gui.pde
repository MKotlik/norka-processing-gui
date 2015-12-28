void setup() {
  size(400,400);
  nPanel main = new nPanel();
  TestButton test = new TestButton("test", 200, 200, 50, 50);
  main.addElement(test);
  main.showPanel();
  main.display();
}

/*
void draw(){
 
 }
 */