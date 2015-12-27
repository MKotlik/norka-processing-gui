public class nPane {
  private int pWidth;
  private int pHeight;
  private int xLines;
  private int yLines;
  private int xSpace;
  private int ySpace;
  private ArrayList<nElement> addedElements = new ArrayList<nElement>(); //For optimization, change this to hash/map system later
  private boolean showGrid;
  private String activeElement;
  private String activeEvent;

  public nPane(int pWidth, int pHeight, int xLines, int yLines) {
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    this.xLines = xLines;
    this.yLines = yLines;
    xSpace = pWidth / xLines;
    ySpace = pHeight / yLines;
  }

  public void setGrid(boolean state) {
    showGrid = state;
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
    if (showGrid) {
      displayGrid();
    }
  }
  
  //This implements an O(n) search through the elements, and will be inefficient at higher #s of elements
  public void addElement(nElement newElement){ //Alternatively could just call it add(...)
    //Checks that new element has unique identifier, since all elements are identifier-referenced
    boolean unique = true;
    int i = 0;
    while (i < addedElements.size() && unique == true){
      if (addedElements.get(i).getIdentifier().equals(newElement.getIdentifier())){
        unique = false;
        System.out.println("Attempted: nPanel.addElement(nElement newElement) on nElement with identifier = " + newElement.getIdentifier());
        System.out.println("ERROR: Could not add this element. An element with the same identifier is already in the panel.");
      }
      i++;
    }
    if (unique){
      addedElements.add(newElement);
    }
  }
  
  public int getElementCount(){
    return addedElements.size();
  }
  
  public String[] getElementIdentifiers(){
    String[] identifierArray = new String[addedElements.size()];
    for (int i = 0; i < addedElements.size(); i++){
      identifierArray[i] = addedElements.get(i).getIdentifier();
    }
    return identifierArray;
  }
  
  //Not sure if this is necessary, but it is coded.
  public nElement[] getElementArray(){
    nElement[] elementArray = new nElement[addedElements.size()];
    for (int i = 0; 0 < addedElements.size(); i++){
      elementArray[i] = addedElements.get(i);
    }
    return elementArray;
  }
  
  public void removeElement(String identifier){
    boolean removed = false;
    int i = 0;
    while (i < addedElements.size() && removed == false){
      if (addedElements.get(i).getIdentifier().equals(identifier)){
        addedElements.remove(i);
        removed = true;
      }
    }
    if (!removed){
      System.out.println("Attempted: nPanel.removeElement(" + identifier + ")");
      System.out.println("ERROR: An element with this identifier could not be found.");
    }
  }
  
  public nElement popElement(String identifier){
    boolean removed = false;
    int i = 0;
    nElement poppedElement = null;
    while (i < addedElements.size() && removed == false){
      if (addedElements.get(i).getIdentifier().equals(identifier)){
        poppedElement = addedElements.get(i);
        addedElements.remove(i);
        removed = true;
      }
    }
    if (!removed){
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