public class nPanel {
  //General panel attributes:
  private int xPos; //Tied to positioning-method
  private int yPos; //Tied to positioning-method
  private int xPosCORNER; //Irrespective of positioning-method
  private int yPosCORNER; //Irrespective of positioning-method
  private int positionMethod; //CORNER = 0, CORNERS = 1, RADIUS = 2, CENTER = 3
  private int pWidth; //Width in pixels
  private int pHeight; //Height in pixels
  private boolean panelVisible; //Determines whether display() functions
  //Panel background attributes:
  private String backgroundState; //"NONE" (panel is transparent), "COLOR", or "IMAGE"
  private color backgroundColor;
  private PImage backgroundImage;
  //Implement grid here when supported!
  /*
  //Grid attributes:
   private boolean gridEnabled;
   private int xLines;
   private int yLines;
   private int xSpace;
   private int ySpace;
   private boolean gridVisible;
   //private String gridType; //when added
   */
  //Element processing attributes:
  private ArrayList<nElement> addedElements;  //For optimization, change this to hash/map system later
  //Only supports one-at-a-time events for now. Expand later to support simultaenous key and mouse action.
  private String activeElement; //"NONE" (default), or element identifier
  private String activeEvent; //"NONE" (default), "MOUSE_CLICK", "MOUSE_PRESS", "MOUSE_HOVER", "KEY_CLICK", or "KEY_PRESS"
  private String prevTriggeredElement; //Stores identifier of the the element active at the previous cycle
  private String prevTriggeredEvent; //Stores event type of the element active at the previous cycle

  //Constructors:
  /*
  public nPanel(int pWidth, int pHeight, int xLines, int yLines) {
   this.pWidth = pWidth;
   this.pHeight = pHeight;
   this.xLines = xLines;
   this.yLines = yLines;
   xSpace = pWidth / xLines;
   ySpace = pHeight / yLines;
   }
   */

  public nPanel() {
    positionMethod = CORNER;
    xPos = 0;
    yPos = 0;
    xPosCORNER = 0;
    yPosCORNER = 0;
    pWidth = width;
    pHeight = height;
    panelVisible = false;
    backgroundState = "NONE"; //Implies no need to initialize background variables
    //gridEnabled = false; //Implies no need to initialize grid variables
    addedElements = new ArrayList<nElement>();
    activeElement = "NONE";
    activeEvent = "NONE";
    prevTriggeredElement = "NONE";
    prevTriggeredEvent = "NONE";
  }

  //Constructor allows for modified positioning and technically different positionMethods, but only works with CORNER for now
  public nPanel(int positionMethod, int xPos, int yPos, int panelWidth, int panelHeight) {
    String constructorCall = "nPanel(" + positionMethod + "," + xPos + "," + yPos + "," + panelWidth + "," + panelHeight + ")";
    if (validatePositionMethod(positionMethod, constructorCall)) {
      if (positionMethod == CORNER) {
        this.positionMethod = positionMethod;
        this.xPos = xPos;
        this.yPos = yPos;
        xPosCORNER = xPos;
        yPosCORNER = yPos;
        pWidth = panelWidth;
        pHeight = panelHeight;
      } else { //EXPAND FOR MORE POSITION METHODS LATER!
        System.out.println("ERROR: We apologize, but no positionMethods but CORNER are supported at this time");
      }
      panelVisible = false;
      backgroundState = "NONE"; //Implies no need to initialize background variables
      //gridEnabled = false; //Implies no need to initialize grid variables
      addedElements = new ArrayList<nElement>();
      activeElement = "NONE";
      activeEvent = "NONE";
      prevTriggeredElement = "NONE";
      prevTriggeredEvent = "NONE";
    }
  }

  //Constructor assumes positionMethod is CORNER by default
  public nPanel(int xPos, int yPos, int panelWidth, int panelHeight) {
    positionMethod = CORNER;
    this.xPos = xPos;
    this.yPos = yPos;
    xPosCORNER = xPos;
    yPosCORNER = yPos;
    pWidth = panelWidth;
    pHeight = panelHeight;
    panelVisible = false;
    backgroundState = "NONE"; //Implies no need to initialize background variables
    //gridEnabled = false; //Implies no need to initialize grid variables
    addedElements = new ArrayList<nElement>();
    activeElement = "NONE";
    activeEvent = "NONE";
    prevTriggeredElement = "NONE";
    prevTriggeredEvent = "NONE";
  }

  private boolean validatePositionMethod(int positionMethod, String constructorCall) {
    if (positionMethod == CORNER || positionMethod == CORNERS || positionMethod == RADIUS || positionMethod == CENTER) {
      return true;
    } else {
      System.out.println("Attempted to create " + constructorCall);
      System.out.println("ERROR: invalid positionMethod. Please use CORNER, CORNERS, RADIUS, or CENTER");
      return false;
    }
  }

  //General Panel methods:
  public void display() {
    if (panelVisible) {
      //Implement background here
      //Implement grid here when supported!
      /*
      if (gridEnabled && gridVisible) {
       displayGrid();
       }
       */
      for (int i = 0; i < addedElements.size(); i++) {
        addedElements.get(i).display(); //Modify this so this is only true when elements are visible
      }
    }
  }

  /*
  public void displayOLD() {
   if (gridVisible) {
   displayGrid();
   }
   for (int i = 0; i < addedElements.size(); i++) {
   addedElements.get(i).display(); //Modify this so this is only true when elements are visible
   }
   }
   */

  public boolean isPanelVisible() {
    return panelVisible;
  }

  public void setPanelVisible(boolean panelState) {
    panelVisible = panelState;
  }

  public void showPanel() {
    panelVisible = true;
  }

  public void hidePanel() {
    panelVisible = false;
  }

  /* ADDITIONAL METHODS:
   - get...() for all of the position variables
   - set...() for all of the position variables
   - setPositionMethod() should automatically recalculate xPosCorner & yPosCorner
   - setXPos & setYPos should modify xPosCorner & yPosCorner according to current positionMethod
   
   - get...() for pWidth & pHeight
   - set...() for pWidth & pHeight
   */

  //Grid methods:
  //Grid is unsupported as of now!
  /* Grid needs:
   - a gridType attribute to determine segmenting
   - get...() & set...() methods for all grid attributes
   - the grid setXLines(), setYLines(), setXSpace(), and setYSpace() methods need to take gridType into account
   - get...(), set...() and show...() and hide...() methods for gridVisible
   */
  /*
  public void setGrid(boolean state) {
   gridVisible = state;
   }
   
   //Alternate way of Grid-control
   public void gridOn(){
   showGrid = true;
   }
   
   public void gridOff(){
   showGrid = false;
   }
   
   public void displayGrid() {
   stroke(255, 0, 0);
   for (int i = 1; i <= xLines; i++) {
   line(i * xSpace, 0, i * xSpace, height);
   }
   for (int j = 0; j < yLines; j++) {
   line(0, j * ySpace, width, j * ySpace);
   }
   }
   */

  //Element processing methods
  public void update() {
    //Updating and resetting element & event instance vars:
    activeElement = "NONE";
    activeEvent = "NONE";
    //Local function vars:
    boolean elementActivated = false;
    //Storing position interaction global vars in case they get modified during computation
    int nMouseX = mouseX;
    int nMouseY = mouseY;
    boolean nMousePressed = mousePressed;
    int nKey = key;
    int nKeyCode = keyCode;
    boolean nKeyPressed = keyPressed;
    int i = 0;
    while (i < addedElements.size() && !elementActivated) {
      nElement currentElement = addedElements.get(i);
      if (!nKeyPressed && prevTriggeredElement.equals(currentElement.getIdentifier()) && prevTriggeredEvent.equals("KEY_PRESS") && currentElement.isKeyClickable()) {
        activeElement = currentElement.getIdentifier();
        activeEvent = "KEY_CLICK";
        elementActivated = true;
        prevTriggeredElement = "NONE";
        prevTriggeredEvent = "NONE";
      } else if (nKeyPressed) {
        if ((nKey != CODED && nKey == currentElement.getKeyBind()) || (nKey == CODED && nKeyCode == currentElement.getKeyBind())) {
          if (currentElement.isKeyPressable()) {
            activeElement = currentElement.getIdentifier();
            activeEvent = "KEY_PRESS";
            elementActivated = true;
          }
          prevTriggeredElement = currentElement.getIdentifier();
          prevTriggeredEvent = "KEY_PRESS";
        }
      } else if (currentElement.checkMouse(nMouseX, nMouseY)) { //Non-rectangular elements supported as long as checkMouse functions correctly
        if (!nMousePressed && prevTriggeredElement.equals(currentElement.getIdentifier()) && prevTriggeredEvent.equals("MOUSE_PRESS") && currentElement.isMouseClickable()) {
          activeElement = currentElement.getIdentifier();
          activeEvent = "MOUSE_CLICK";
          elementActivated = true;
          prevTriggeredElement = "NONE";
          prevTriggeredEvent = "NONE";
        } else if (nMousePressed) {
          if (currentElement.isMousePressable()) {
            activeElement = currentElement.getIdentifier();
            activeEvent = "MOUSE_PRESS";
            elementActivated = true;
          }
          prevTriggeredElement = currentElement.getIdentifier();
          prevTriggeredEvent = "MOUSE_PRESS";
        } else if (currentElement.isHoverable()) {
          activeElement = currentElement.getIdentifier();
          activeEvent = "MOUSE_HOVER";
          elementActivated = true;
        }
      }
      i++;
    }
  }

  //This implements an O(n) search through the elements, and will be inefficient at higher #s of elements
  public void addElement(nElement newElement) { //Alternatively could just call it add(...)
    //Checks that new element has unique identifier, since all elements are identifier-referenced
    boolean unique = true;
    int i = 0;
    while (i < addedElements.size() && unique == true) {
      if (addedElements.get(i).getIdentifier().equals(newElement.getIdentifier())) {
        unique = false;
        System.out.println("Attempted: nPanel.addElement(nElement newElement) on nElement with identifier = " + newElement.getIdentifier());
        System.out.println("ERROR: Could not add this element. An element with the same identifier is already in the panel.");
      }
      i++;
    }
    if (unique) {
      addedElements.add(newElement);
    }
  }

  public int getElementCount() {
    return addedElements.size();
  }

  public String[] getElementIdentifiers() {
    String[] identifierArray = new String[addedElements.size()];
    for (int i = 0; i < addedElements.size(); i++) {
      identifierArray[i] = addedElements.get(i).getIdentifier();
    }
    return identifierArray;
  }

  //Not sure if this is necessary, but it is coded.
  public nElement[] getElementArray() {
    nElement[] elementArray = new nElement[addedElements.size()];
    for (int i = 0; 0 < addedElements.size(); i++) {
      elementArray[i] = addedElements.get(i);
    }
    return elementArray;
  }

  public void removeElement(String identifier) {
    boolean removed = false;
    int i = 0;
    while (i < addedElements.size() && removed == false) {
      if (addedElements.get(i).getIdentifier().equals(identifier)) {
        addedElements.remove(i);
        removed = true;
      }
    }
    if (!removed) {
      System.out.println("Attempted: nPanel.removeElement(" + identifier + ")");
      System.out.println("ERROR: An element with this identifier could not be found.");
    }
  }

  public nElement popElement(String identifier) {
    boolean removed = false;
    int i = 0;
    nElement poppedElement = null;
    while (i < addedElements.size() && removed == false) {
      if (addedElements.get(i).getIdentifier().equals(identifier)) {
        poppedElement = addedElements.get(i);
        addedElements.remove(i);
        removed = true;
      }
    }
    if (!removed) {
      System.out.println("Attempted: nPanel.removeElement(" + identifier + ")");
      System.out.println("ERROR: An element with this identifier could not be found.");
    }
    return poppedElement; //WARNING, as of now, you can return a null. Make sure to catch it wherever this is used!
  }

  public String getActiveElement() {
    return activeElement;
  }

  public String getActiveEvent() {
    return activeEvent;
  }

  public String getAction() {
    return activeElement + "-" + activeEvent;
  }
}