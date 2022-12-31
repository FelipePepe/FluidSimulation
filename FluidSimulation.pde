// https://mikeash.com/pyblog/fluid-simulation-for-dummies.html

Fluid fluid;
float t = 0;

void settings() {
  size(N * SCALE, N * SCALE);
}

void setup() {
  fluid = new Fluid(0.2, 0, 0);
}

//void mouseDragged() {
//  fluid.addDensity(mouseX /SCALE, mouseY /SCALE, 100);
//  float amtX = mouseX - pmouseX;
//  float amtY = mouseY - pmouseY;
//  fluid.addVelocity(mouseX /SCALE, mouseY /SCALE, amtX, amtY);
//}

void draw() {
  background(0);
  int cx = int(0.5 * width /SCALE);
  int cy = int(0.5 * height /SCALE);

  fluid.addDensity(cx, cy, random(100, 500));

  float angle = noise(t) * TWO_PI * 2;
  PVector v = PVector.fromAngle(angle);
  v.mult(0.2);
  t += 0.01;

  fluid.addVelocity(cx, cy, v.x, v.y);

  fluid.step();
  fluid.renderD();
  fluid.renderV();
  fluid.fadeD();
}
