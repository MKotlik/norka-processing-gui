public class nButton extends nElement {
  //Label attributes
  private String label;
  private boolean labelVisible;
  private int labelSize;
  private PFont labelFont;
  private color labelColor;

  //Constructors:
  public nButton() {
    super();
    setMouseClickable(true);
    setOutline();
    showOutline();
    label = "";
    labelSize = 16;
  }

  public nButton(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    super(identifier, xPixelPos, yPixelPos, pWidth, pHeight);
    setMouseClickable(true);
    setOutline();
    showOutline();
    label = "";
    labelSize = 16;
  }

  //Label methods:
  public boolean isLabelVisible() {
    return labelVisible;
  }

  public void setLabelVisible(boolean newVisibility) {
    labelVisible = newVisibility;
  }

  public void showLabel() {
    labelVisible = true;
  }

  public void hideLabel() {
    labelVisible = false;
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String newLabel) {
    label = newLabel;
  }

  public void setLabelSize(int newSize) {
    labelSize = newSize;
  }

  public void setLabelColor(color newColor) {
    labelColor = newColor;
  }

  public void setLabelFont(PFont newFont) {
    labelFont = newFont;
  }

  public void setLabel(String newLabel, int newSize, color newColor, PFont newFont) {
    label = newLabel;
    labelSize = newSize;
    labelColor = newColor;
    labelFont = newFont;
  }

  public void setLabel(String newLabel, int newSize, color newColor) {
    label = newLabel;
    labelSize = newSize;
    labelColor = newColor;
  }

  //get methods for label size, color, and font

  public void display() {
    if (isOutlineVisible() && getOutlineState() == true) {
      stroke(getOutlineColor());
      strokeWeight(getOutlineWeight());
    } else {
      noStroke();
    }
    if (isBackgroundVisible() && ! getBackgroundState().equals("NONE")) {
      if (getBackgroundState().equals("COLOR")) {
        fill(getBackgroundColor());
      } else if (getBackgroundState().equals("IMAGE")) {
        noFill();
        //Implement background image support here!
      }
    } else {
      noFill();
    }
    rectMode(CORNER);
    rect(getXPixelPos(), getYPixelPos(), getPixelWidth(), getPixelHeight());
    if (labelVisible) {
      if (labelFont != null){
        textFont(labelFont, labelSize);
      }
      fill(labelColor);
      textSize(labelSize);
      //textAlign(LEFT);
      text(label, getXPixelPos(), getYPixelPos());
    }
  }

  public boolean checkMouse(int nMouseX, int nMouseY) {
    return (nMouseX >= getXPixelPos() && nMouseX <= (getXPixelPos() + getPixelWidth()) && nMouseY >= getYPixelPos() && nMouseY <= (getYPixelPos() + getPixelHeight()));
  }
}