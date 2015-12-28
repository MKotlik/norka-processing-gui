public abstract class nElement {
  //General panel attributes
  private String identifier;
  //All positions are relative to the window, not to the panel
  private int xLinePos;
  private int yLinePos;
  private int xPixelPos;
  private int yPixelPos;
  private int lineWidth;
  private int lineHeight;
  private int pWidth;
  private int pHeight;
  
  //Interactivity attributes
  private boolean acceptMousePress;
  private boolean acceptMouseClick;
  private boolean acceptHover;
  private boolean acceptKeyPress;
  private boolean acceptKeyClick;
  private int keyBind;
  
  //Need a default constructor
  
  //Subdefault constructors need to be modified
  /*
  public nElement(String identifier) {
    this.identifier = identifier;
    acceptClick = false;
    acceptHover = false;
    acceptKey = false;
    keyBind = 0;
  }
  */

  public nElement(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    this.identifier = identifier;
    this.xPixelPos = xPixelPos;
    this.yPixelPos = yPixelPos;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
  }

  //Additional Feature: Construct based on given shape.

  public String getIdentifier() {
    return identifier;
  }

  public void setIdentifier(String newIdentifier) {
    identifier = newIdentifier;
  }

  public boolean isHoverable() {
    return acceptHover;
  }

  public void setHoverable(boolean newHoverState) {
    acceptHover = newHoverState;
  }

  public boolean isMouseClickable() {
    return acceptMouseClick;
  }

  public void setMouseClickable(boolean newClickState) {
    acceptMouseClick = newClickState;
  }
  
  public boolean isMousePressable() {
    return acceptMousePress;
  }

  public void setMousePressable(boolean newPressState) {
    acceptMousePress = newPressState;
  }


  public boolean isKeyClickable() {
    return acceptKeyClick;
  }

  public void setKeyClickable(boolean newKeyState) {
    acceptKeyClick = newKeyState;
  }
  
  public boolean isKeyPressable() {
    return acceptKeyPress;
  }

  public void setKeyPressable(boolean newKeyState) {
    acceptKeyPress = newKeyState;
  }

  public int getKeyBind() {
    return keyBind;
  }

  //This accepts both the int/ASCII values of chars, and the int KeyCode values
  public void setKeyBind(int newKeyBind) {
    keyBind = newKeyBind;
  }

  public void setKeyBind(char newKeyBind) {
    keyBind = (int)(newKeyBind);
  }

  public int getXLinePos() {
    return xLinePos;
  }

  public int getYLinePos() {
    return yLinePos;
  }

  public int getXPixelPos() {
    return xPixelPos;
  }

  public int getYPixelPos() {
    return yPixelPos;
  }

  public int getLineWidth() {
    return lineWidth;
  }

  public int getLineHeight() {
    return lineHeight;
  }

  public int getPixelWidth() { //Might imply that PixelWidth is the same as the main pixelWidth constant, but should be pretty clear.
    return pWidth;
  }

  public int getPixelHeight() {
    return pHeight;
  }

  public abstract boolean checkMouse(int nMouseX, int nMouseY);

  public abstract void display();
}