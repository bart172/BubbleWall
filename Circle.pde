class Circle {
  float x;
  float y;
  float r;
  float alpha;
  
  Circle() {
    this.x = random(width);
    this.y = random(height);
    this.r = random(10, 250);
    this.alpha = random(50, 200);
  }
  
  void move(float x, float y) {
    float dx = x-width/2;
    float dy = y-height/2;
    
    float mag = map(this.r, 0, 250, 0, 0.01);
    
    this.x += dx*mag;
    this.y += dy*mag;
    
    this.alpha += random(-4, 4);
  }
  
  void reset() {
    float oldRad = this.r;
    this.r = random(10, 250);
    this.alpha = random(50, 200);
    
    if (this.x > width + oldRad) {
      this.x = -this.r;
      this.y = random(height);
    }
    
    if (this.x < -oldRad) {
      this.x = width + this.r;
      this.y = random(height);
    }
    
    if (this.y > height + oldRad) {
      this.y = -this.r;
      this.x = random(width);
    }
    
    if (this.y < -oldRad) {
      this.y = height + this.r;
      this.x = random(width);
    }
  }
  
  boolean isOutOfBounds() {
    return (
      this.x > width + this.r  ||
      this.x < -this.r         ||
      this.y > height + this.r ||
      this.y < -this.r
    );
  }
  
  void display() {
    noStroke();
    fill(255, this.alpha);
    ellipse(this.x, this.y, this.r, this.r);
  }
}
