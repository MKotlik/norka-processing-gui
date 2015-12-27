public class nPane {
  private int pWidth;
  private int pHeight;
  private int xLines;
  private int yLines;
  private int xSpace;
  private int ySpace;
  //private ArrayList<nElement> addedElements = new ArrayList<nElement>();
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