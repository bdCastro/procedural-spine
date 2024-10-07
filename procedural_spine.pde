PVector head;
PVector[] body;
int radius;
int bodySize = 49;

void setup() {
  size(640, 360);
  head = new PVector(width/2, height/2);
  body = new PVector[bodySize];
  radius = 20;
  
  for(int i = 0; i < bodySize; i++) {
    body[i] = new PVector(width/2, height/2);
  }
}

void draw() {
  background(255);
  drawVertebra(head, false);
  PVector lastV = head.copy();
  for(PVector v : body) {
    PVector vBetween = v.copy().sub(lastV);
    vBetween.setMag(radius/2);
    line(lastV.x, lastV.y, lastV.x + vBetween.x, lastV.y + vBetween.y);
    v.set(lastV.add(vBetween));
    
    drawVertebra(v, false);
    lastV = v.copy();
  }
}

void drawVertebra(PVector v, boolean r) {
  fill(1);
  ellipse(v.x, v.y, 5, 5);
  
  if(r) {
    noFill();
    ellipse(v.x, v.y, radius, radius);
  }
  
  if(mousePressed) head.set(mouseX, mouseY);
}
