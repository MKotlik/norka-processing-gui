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
  
  public String getIdentifier(){
    return identifier;
  }
  
  public void setIdentifier(String newIdentifier){
    identifier = newIdentifier;
  }
  
  public boolean checkHover() {
    return acceptHover;
  }
  
  public void setHover(boolean newHoverState){
    acceptHover = newHoverState;
  }

  public boolean checkClick() {
    return acceptClick;
  }
  
  public void setClick(boolean newClickState){
    acceptClick = newClickState;
  }

  public boolean checkKey() {
    return acceptKey;
  }
  
  public void setKeyState(boolean newKeyState){
    acceptKey = newKeyState;
  }

  public int getKeyBind() {
    return keyBind;
  }
  
  //This accepts both the int/ASCII values of chars, and the int KeyCode values
  public void setKeyBind(int newKeyBind){
    keyBind = newKeyBind;
  }
  
  public void setKeyBind(char newKeyBind){
    keyBind = (int)(newKeyBind);
  }

  public abstract void display();
}