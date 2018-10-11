float cellWidth = 60;
float cellHeight = 60;
float horizontalMargin = 40;
float verticalMargin = 20;
boolean showGrid = false;
int[] markedTriangle = { 7, 10 };
int[] bgColor = { 213, 214, 219 };
int[][] pallete = {
  { 98,118,119 },
  { 60,70,82 },
  { 18,17,22 }
};
int mode = 0; //0: Normal, 1: Triangles circling, 2: Triangles pointing
float columns;
float rows;

void setup() {
  size(600, 900);
  noLoop();
  columns = floor(width/cellWidth);
  rows = floor(height/cellHeight);
  smooth();
}

void draw() {
  drawBg();
  if(showGrid) drawGrid();
  drawTriangles();
}

void drawBg() {
  float increment = 0.02;
  float noise = 0;
  float xoff = 0;

  loadPixels();
  
  for(int x = 0; x < width; x++) {
    xoff += increment;
    float yoff = 0; 
    for(int y = 0; y < height; y++) {
      yoff += increment;
      float variation = noise(xoff, yoff) * random(0, 30);
      pixels[x + y * width] = color(bgColor[0] - variation, bgColor[1] - variation,bgColor[2] - variation);
      noise += 0.1;
    }
  }

  updatePixels();
}

void drawGrid() {
  stroke(0, 0, 0, 40);
  for(int x = 1; x < columns; x++) {
    line(x * cellWidth, 0, x * cellWidth, height);
  }
  
  for(int y = 1; y < rows; y++) {
    line(0, y * cellHeight, width, y * cellHeight);
  }
}

void drawTriangles() {
  noFill();
  PVector vTheOne = new PVector((markedTriangle[0] * cellWidth) + (cellWidth/2), (markedTriangle[1] * cellHeight) + (cellHeight/2));
  
  for(int x = 0; x < columns; x++) {
    for(int y = 0; y < rows; y++) {
      
      PVector vThis = new PVector((x * cellWidth) + (cellWidth/2), (y * cellHeight) + (cellHeight/2));
      float angle = 0;
      int palleteIndex = floor(random(0, pallete.length)); 
      float alpha = random(100, 230);
      
      if(x == markedTriangle[0] && y == markedTriangle[1]) {
        strokeWeight(3);
        stroke(255);
      } else {
        strokeWeight(1);
        stroke(pallete[palleteIndex][0], pallete[palleteIndex][1], pallete[palleteIndex][2], alpha);
        angle = getAngle((markedTriangle[0] * cellWidth) + (cellWidth/2), 
        (markedTriangle[1] * cellHeight) + (cellHeight/2),
        (x * cellWidth) + (cellWidth/2), 
        (y * cellHeight) + (cellHeight/2));
      }
      
      pushMatrix();

      translate((x*cellWidth) + (cellWidth/2), (y*cellHeight) + (cellHeight/2)); 
      rotate(angle);
      triangle((horizontalMargin/2)-(cellWidth/2), 
        (cellHeight/2)-(verticalMargin/2), 
        0,
        (verticalMargin/2) - (cellHeight/2),
        (cellWidth/2) - (horizontalMargin/2), 
        (cellHeight/2) - (verticalMargin/2));
      
      popMatrix();
    }
  }
}

float getAngle(float pX1, float pY1, float pX2, float pY2){
  if(mode == 0) {
    return 0;
  }
  else if(mode == 1) {
    return atan2(pY2 - pY1, pX2 - pX1);
  }
  else {
    return atan2(pY2 - pY1, pX2 - pX1) + 3*PI/2;
  }
}

void mousePressed() 
{
  saveFrame("triangles.png");
}
