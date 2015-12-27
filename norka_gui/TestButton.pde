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
  
  public void display(){
    fill(255);
    stroke(0);
    rectMode(CENTER);
    rect(getXPixelPos(), getYPixelPos(), getPixelWidth(), getPixelHeight());
  }
}