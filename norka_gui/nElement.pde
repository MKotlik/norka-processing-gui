public abstract class nElement {
  //General panel attributes
  private String identifier;
  private boolean visible;

  //All positions are relative to the window, not to the panel
  private int xPixelPos;
  private int yPixelPos;
  private int pWidth;
  private int pHeight;

  //Grid unsupported as of now
  /*
  private int xLinePos;
   private int yLinePos;
   private int lineWidth;
   private int lineHeight;
   */

  //Interactivity attributes
  private boolean acceptMousePress;
  private boolean acceptMouseClick;
  private boolean acceptHover;
  private boolean acceptKeyPress;
  private boolean acceptKeyClick;
  private int keyBind;

  //Display attributes
  private String backgroundState; //"NONE" (element is transparent), "COLOR", or "IMAGE"
  private color backgroundColor;
  private PImage backgroundImage;
  private boolean backgroundVisible;

  //Constructors:

  public nElement() {
    identifier = "default";
    xPixelPos = 0;
    yPixelPos = 0;
    pWidth = 0;
    pHeight = 0;
    visible = true;
    //All interactivity booleans should be false by default
    backgroundState = "NONE";
  }

  public nElement(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    this.identifier = identifier;
    this.xPixelPos = xPixelPos;
    this.yPixelPos = yPixelPos;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    visible = true;
    backgroundState = "NONE";
  }

  //Additional Feature: Construct based on given shape.

  //General element methods

  public String getIdentifier() {
    return identifier;
  }

  public void setIdentifier(String newIdentifier) {
    identifier = newIdentifier;
  }

  public boolean isVisible() {
    return visible;
  }

  public void setVisible(boolean newVisibility) {
    visible = newVisibility;
  }

  public void show() {
    visible = true;
  }

  public void hide() {
    visible = false;
  }

  public abstract void display();

  //Element position methods:

  public int getXPixelPos() {
    return xPixelPos;
  }

  public int getYPixelPos() {
    return yPixelPos;
  }

  public int getPixelWidth() { //Might imply that PixelWidth is the same as the main pixelWidth constant, but should be pretty clear.
    return pWidth;
  }

  public int getPixelHeight() {
    return pHeight;
  }

  //Grid methods unsupported as of now
  /*
  public int getXLinePos() {
   return xLinePos;
   }
   
   public int getYLinePos() {
   return yLinePos;
   }
   
   public int getLineWidth() {
   return lineWidth;
   }
   
   public int getLineHeight() {
   return lineHeight;
   }
   */

  //Element interactivity methods:

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

  public abstract boolean checkMouse(int nMouseX, int nMouseY);

  //Element display methods:
  public String getBackgroundState() {
    return backgroundState;
  }

  public void setBackgroundState(String newState) {
    if (newState.equals("NONE") || newState.equals("COLOR") || newState.equals("IMAGE")) {
      backgroundState = newState;
    } else {
      println("Attempted: nElement.setBackgroundState(" + newState + ") on nElement with identifier=" + identifier);
      println("ERROR: invalid backgroundState type. Please use NONE, COLOR, or IMAGE");
    }
  }

  public color getBackgroundColor() {
    if (backgroundState.equals("COLOR")) {
      return backgroundColor;
    } else {
      println("Attempted: nElement.getBackgroundColor() on nElement with identifier=" + identifier);
      println("ERROR: this element has no background color. Its backgroundState is " + backgroundState);
      return -1;
    }
  }

  public PImage getBackgroundImage() {
    if (backgroundState.equals("IMAGE")) {
      return backgroundImage;
    } else {
      println("Attempted: nElement.getBackgroundImage() on nElement with identifier=" + identifier);
      println("ERROR: this element has no background image. Its backgroundState is " + backgroundState);
      return null;
    }
  }

  public void setBackgroundColor(color newBackgroundColor) {
    backgroundState = "COLOR";
    backgroundColor = newBackgroundColor;
    backgroundImage = null; //This is controversial. Maybe I should keep the image on the heap?
  }

  public void setBackgroundImage(PImage newBackgroundImage) {
    backgroundState = "IMAGE";
    backgroundImage = newBackgroundImage;
    backgroundColor = -1; //This is controversial. Maybe I should keep the color on the heap?
  }

  public boolean isBackgroundVisible() {
    return backgroundVisible;
  }

  public void setBackgroundVisible(boolean newVisibility) {
    backgroundVisible = newVisibility;
  }

  public void showBackground() {
    backgroundVisible = true;
  }

  public void hideBackground() {
    backgroundVisible = false;
  }
}