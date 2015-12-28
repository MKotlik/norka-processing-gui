public class TestButton extends nElement{
  private String label;
  
  public TestButton(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight){
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    label = "";
  }
  
  public String getLabel(){
    return label;
  }
  
  public void setLabel(String newLabel){
    label = newLabel;
  }
  
  //(nMouseX >= currentElement.getXPixelPos() && nMouseX <= (currentElement.getXPixelPos() + currentElement.getPixelWidth()) && nMouseY >= currentElement.getYPixelPos() && nMouseX <= (currentElement.getYPixelPos() + currentElement.getPixelHeight()))
  public boolean checkMouse(int nMouseX, int nMouseY){
    return (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseX <= (getYPixelPos() + getPixelHeight()));
  }
  
  public void display(){
    fill(255);
    stroke(0);
    rectMode(CENTER); //Change this to Corner mode
    rect(getXPixelPos(), getYPixelPos(), getPixelWidth(), getPixelHeight());
  }
}