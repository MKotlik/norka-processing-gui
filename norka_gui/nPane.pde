public class nPane{
  private int pWidth;
  private int pHeight;
  private int xLines;
  private int yLines;
  private int xSpace;
  private int ySpace;
  //private ArrayList<nElement> addedElements = new ArrayList<nElement>();
  
  public nPane(int pWidth, int pHeight, int xLines, int yLines){
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    this.xLines = xLines;
    this.yLines = yLines;
    xSpace = pWidth / xLines;
    ySpace = pHeight / yLines;
  }
  
  public void showGrid(){
    fill(255,0,0);
    for (int i = 1; i <= xLines; i++){
      line(i * xSpace, 0, i * xSpace, height);
    }
    for (int j = 0; j < yLines; j++){
      line(0, j * ySpace, width, j * ySpace);
    }
  }
}