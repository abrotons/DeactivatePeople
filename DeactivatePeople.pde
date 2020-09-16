float angle = 0.0;
float idista = 35.0;
float dista = 25.0;
float phase = TWO_PI/3;
float sphereSize = 8.0;

float angx[] = new float[3];
float angy[] = new float[3];

int num = 4;
boolean optDrawLines = true;
boolean optDrawSpheres = true;

void setup() {
  size(600, 900);
  //fullScreen();
  background(0);
  colorMode(HSB);
  noCursor();
}

void draw() {
  noStroke();
  blendMode(MULTIPLY);
  fill(0, 6);
  //fill(0, map(cos(angle), -1, 1, 2, 15));
  rect(0, 0, width, height);
  blendMode(SCREEN);

  strokeWeight(20);
  stroke((angle*50)%255, 255, 255);

  angx[0] = dista*cos(angle);
  angx[1] = dista*cos(angle+phase);
  angx[2] = dista*cos(angle-phase);

  angy[0] = dista*sin(angle);
  angy[1] = dista*sin(angle+phase);
  angy[2] = dista*sin(angle-phase);

  int nX = mouseY*width/height;
  int nY = mouseX*height/width;
  int pX = pmouseY*width/height;
  int pY = pmouseX*height/width;

  if (optDrawLines) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    if (num>1)line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    if (num>2)line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    if (num>2)line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    if (num>3)line(nX, nY, pX, pY);
    if (num>3)line(width-nX, nY, width-pX, pY);
    if (num>3)line(nX, height-nY, pX, height-pY);
    if (num>3)line(width-nX, height-nY, width-pX, height-pY);
  }

  if (optDrawSpheres) {
    drawSphere(mouseX, mouseY);
    if (num>1)drawSphere(width-mouseX, mouseY);
    if (num>2)drawSphere(mouseX, height-mouseY);
    if (num>2)drawSphere(width-mouseX, height-mouseY);
    if (num>3)drawSphere(nX, nY);
    if (num>3)drawSphere(width-nX, nY);
    if (num>3)drawSphere(nX, height-nY);
    if (num>3)drawSphere(width-nX, height-nY);
  }

  angle += 0.08;
  dista = idista + cos(angle)*10.0;

  if (optShowHelp) drawHelp();
}

void drawSphere(int x, int y) {
  strokeWeight(4);

  stroke((angle*5+127)%255, 255, 255, 127);
  line(x, y, x+angx[0], y+angy[0]);
  line(x, y, x+angx[1], y+angy[1]);
  line(x, y, x+angx[2], y+angy[2]);

  stroke((angle*5+127)%255, 255, 255, 35);
  line(x+angx[0], y+angy[0], x+angx[1], y+angy[1]);
  line(x+angx[1], y+angy[1], x+angx[2], y+angy[2]);
  line(x+angx[2], y+angy[2], x+angx[0], y+angy[0]);

  noStroke();
  fill((angle*100+192)%255, 255, 255, 192);
  ellipse(x+angx[0], y+angy[0], sphereSize, sphereSize);
  ellipse(x+angx[1], y+angy[1], sphereSize, sphereSize);
  ellipse(x+angx[2], y+angy[2], sphereSize, sphereSize);
}

void keyPressed() {
  if (key == 'p') {
    saveFrame("deactivate-people-######.png");
  } else if (key == 'l') {
    optDrawLines = !optDrawLines;
  } else if (key == 's') {
    optDrawSpheres = !optDrawSpheres;
  } else if (key == 'h') {
    optShowHelp = !optShowHelp;
  } else if (key >= '1' && key <= '4') {
    num = key - '0';
  }
}
