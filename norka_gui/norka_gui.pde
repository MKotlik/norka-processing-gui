void setup() {
  size(400, 400);
  background(255);
  nPane main = new nPane(400, 400, 10, 10);
  main.setGrid(true);
  main.addElement(new TestButton("test",40,40,10,10));
  main.display();
}

/*
void draw(){
 
 }
 */