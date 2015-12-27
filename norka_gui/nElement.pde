public abstract class nElement {
  private String identifier;
  private boolean acceptClick;
  private boolean acceptHover;
  private boolean acceptKey;
  private int keyBind;
  private int xLinePos;
  private int yLinePos;
  private int xPixelPos;
  private int yPixelPos;
  private int lineWidth;
  private int lineHeight;
  private int pWidth;
  private int pHeight;


  public nElement(String identifier) {
    this.identifier = identifier;
    acceptClick = false;
    acceptHover = false;
    acceptKey = false;
    keyBind = 0;
  }

  public nElement(String identifier, int xPixelPos, int yPixelPos, int pWidth, int pHeight) {
    this.identifier = identifier;
    this.xPixelPos = xPixelPos;
    this.yPixelPos = yPixelPos;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
  }

  public String getIdentifier() {
    return identifier;
  }

  public void setIdentifier(String newIdentifier) {
    identifier = newIdentifier;
  }

  public boolean checkHover() {
    return acceptHover;
  }

  public void setHover(boolean newHoverState) {
    acceptHover = newHoverState;
  }

  public boolean checkClick() {
    return acceptClick;
  }

  public void setClick(boolean newClickState) {
    acceptClick = newClickState;
  }

  public boolean checkKey() {
    return acceptKey;
  }

  public void setKeyState(boolean newKeyState) {
    acceptKey = newKeyState;
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

  public abstract void display();
}