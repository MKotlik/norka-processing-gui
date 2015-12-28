public class TestButton extends nElement {
  private String label;

  public TestButton(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    label = "";
    setMouseClickable(true);
    setKeyClickable(true);
    setKeyBind('y');
    setHoverable(true);
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String newLabel) {
    label = newLabel;
  }

  public boolean checkMouse(int nMouseX, int nMouseY) {
    return (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseY <= (getYPixelPos() + getPixelHeight()));
  }

  /*
  //For debugging
   public boolean checkMouse(int nMouseX, int nMouseY) {
   if (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseY <= (getYPixelPos() + getPixelHeight())){
   println("Mouse is over button");
   return true;
   }
   println("Mouse is NOT over button");
   return false;
   }
   */

  public void display() {
    fill(255);
    stroke(0);
    rectMode(CORNER); //Change this to Corner mode
    rect(getXPixelPos(), getYPixelPos(), getPixelWidth(), getPixelHeight());
  }
}