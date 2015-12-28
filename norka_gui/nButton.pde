public class nButton extends nElement {
  //Label attributes
  private String label;
  private boolean labelVisible;
  private int labelSize;
  private PFont labelFont;
  
  //Constructors:
  public nButton(){
    super();
    setMouseClickable(true);
    label = "";
  }
  
  public nButton(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight){
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setMouseClickable(true);
    label = "";
  }
  
  
  public void display() {
  }

  public boolean checkMouse(int nMouseX, int nMouseY) {
    return (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseY <= (getYPixelPos() + getPixelHeight()));
  }
}