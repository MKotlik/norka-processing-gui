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
  //Grid attributes:
  private boolean gridEnabled;
  private int xLines;
  private int yLines;
  private int xSpace;
  private int ySpace;
  //Element processing attributes:
  private ArrayList<nElement> addedElements;  //For optimization, change this to hash/map system later
  private boolean gridVisible;
  private String activeElement;
  private String activeEvent;

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
    backgroundState = "NONE"; //Implies no need to initialize background variables
    gridEnabled = false; //Implies no need to initialize grid variables
    addedElements = new ArrayList<nElement>();
    activeElement = "";
    activeEvent = "";
  }

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
      backgroundState = "NONE"; //Implies no need to initialize background variables
      gridEnabled = false; //Implies no need to initialize grid variables
      addedElements = new ArrayList<nElement>();
      activeElement = "";
      activeEvent = "";
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
    backgroundState = "NONE"; //Implies no need to initialize background variables
    gridEnabled = false; //Implies no need to initialize grid variables
    addedElements = new ArrayList<nElement>();
    activeElement = "";
    activeEvent = "";
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

  //Grid methods:
  public void setGrid(boolean state) {
    gridVisible = state;
  }

  //Alternate way of Grid-control
  /*
  public void gridOn(){
   showGrid = true;
   }
   
   public void gridOff(){
   showGrid = false;
   }
   */

  public void displayGrid() {
    stroke(255, 0, 0);
    for (int i = 1; i <= xLines; i++) {
      line(i * xSpace, 0, i * xSpace, height);
    }
    for (int j = 0; j < yLines; j++) {
      line(0, j * ySpace, width, j * ySpace);
    }
  }

  public void display() {
    if (gridVisible) {
      displayGrid();
    }
    for (int i = 0; i < addedElements.size(); i++) {
      addedElements.get(i).display(); //Modify this so this is only true when elements are visible
    }
  }

  //Element processing methods
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