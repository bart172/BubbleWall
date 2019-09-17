int num = 75;
Circle[] items = new Circle[num];

AccelerometerManager accel;
float ax, ay, az;

float autoAngle;
float autoMagnitude;

void setup() {
  accel = new AccelerometerManager(this);
  orientation(PORTRAIT);
  for (int i = 0; i<items.length; i++) {
    items[i] = new Circle();
  }
  
  autoAngle = 0;
  autoMagnitude = 20;
}

void draw() {
  background(#0080FF);
  
  for (Circle item : items) {
    item.display();
    if (item.isOutOfBounds()) {
      item.reset();
    }
    autoMove(item);
    item.move(ax, ay);
  }
}

void autoMove(Circle c) {

  float x, y;
  
  x = cos(autoAngle)*autoMagnitude + width/2;
  y = sin(autoAngle)*autoMagnitude + height/2;
  c.move(x, y);
  autoAngle+=0.00001;
  
}

public void resume() {
  if (accel != null) {
    accel.resume();
  }
}

public void pause() {
  if (accel != null) {
    accel.pause();
  }
}

public void shakeEvent(float force) {
  float forceFill = map(force, 0, 10, 0, 255);
  fill(forceFill, forceFill, forceFill);
}

public void accelerationEvent(float x, float y, float z) {
//  println("acceleration: " + x + ", " + y + ", " + z);
  ax = map(x, -10, 10, width - 20, 20);
  ay = map(y, -10, 10, 20, height - 20);
  
}
