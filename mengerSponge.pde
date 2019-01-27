float angle = 0;
ArrayList<Box> mengerSponge;

void setup() {
  size(700, 700, P3D);
  mengerSponge = new ArrayList<Box>();
  Box b = new Box(0, 0, 0, 300);
  mengerSponge.add(b);
  //fill(0);
  rect(width/2, height/2, width, height, 0.3);
}

void draw() {
  background(255);
  stroke(75, 75, 115);
  strokeWeight(5);
  fill(200, 200, 15);
  lights();
  translate(width/2, height/2);
  rotateY(angle += 0.01);

  for (Box b : mengerSponge) {
    b.display();
  }
}

void keyPressed() {
  if (key == ' ') {
    ArrayList<Box> newMengerSponge = new ArrayList<Box>();
    for (Box b : mengerSponge) {
      ArrayList<Box> newboxes = b.boxes();
      newMengerSponge.addAll(newboxes);
    }
    mengerSponge = newMengerSponge;
  }
}

class Box {
  PVector position;
  float radius;

  Box(float x, float y, float z, float radius) {
    position = new PVector(x, y, z);
    this.radius = radius;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    stroke(75, 75, 115);
    fill(200, 200, 15);
    box(radius);
    popMatrix();
  }

  ArrayList<Box> boxes () {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newRadius = radius / 3;
          if (sum > 1) {
            boxes.add(new Box((position.x + x * newRadius), (position.y + y * newRadius), (position.z + z * newRadius), newRadius));
          }
        }
      }
    }
    return boxes;
  }
}