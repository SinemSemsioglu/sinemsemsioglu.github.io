/* @pjs preload="clouds.png" */

class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float gradient;
  float reduce;
  int swap;
  
   Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = new PVector(-0.001, 0.01);
    topspeed = random(5,10);
  }
  
  Mover(float x, float y, float vx, float vy, float ax, float ay, int max){
     location = new PVector(x,y);
     velocity = new PVector(vx,vy);
     acceleration = new PVector(ax,ay);
     topspeed = max;
  }
  
  Mover(float x, float y, float z, float vx, float vy, float vz, float ax, float ay, float az, int max){
    location = new PVector(x,y,z);
    velocity = new PVector(vx,vy,vz);
    acceleration = new PVector(ax,ay,az);
    topspeed = max;
    gradient = 1.5;
    swap = 0;
  }
  
  void update() {
    // The Mover moves.
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  
  void updateA() {

    PVector mouse = new PVector(mouseX,mouseY);
    // Step 1: Compute direction
    PVector dir = PVector.sub(mouse,location);
    float mag = dir.mag();

    // Step 2: Normalize
    dir.normalize();

    // Step 3: Scale
    dir.mult(0.01*mag);

    // Step 4: Accelerate
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }

  void display() {
    stroke(255);
    fill(200,100,150);
    // The Mover is displayed.
    ellipse(location.x,location.y,16,16);
  }
  
  void display3d(){
     
     translate(location.x, location.y, location.z);
     
     if(reduce>200 || reduce <0) swap += 1;
     
     if(swap%2 == 0){
       stroke(255-reduce,255-(reduce*1.5),255-(reduce*2));
       reduce += gradient;
     }else if(swap%2 == 1){
       stroke(255-reduce,255-(reduce*1.5),255-(reduce*2));
       reduce -= gradient;
     }
     
     sphere(1);
  }
  void checkEdges() {

    //[full] When it reaches one edge, set location to the other.
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
    //[end]

  }
    
  void limit(float max){
     if(velocity.mag() >max) {
        velocity.normalize();
        velocity.mult(10);
        acceleration = new PVector(0,0);
     }
  }
 

}


Mover[] movers;
int num;
PImage cloud;

void setup(){
 size(500,500);
 num = 5;
 cloud = loadImage("clouds.png");
 movers = new Mover[num*3];
 for(int i=0; i<num; i++){
  movers[i]= new Mover(); 
 }
}

void draw(){
 image(cloud,0,0);
  for(int i=0; i<num; i++){
    movers[i].updateA();
    movers[i].checkEdges();
    movers[i].display();
   }
}
  
void keyPressed(){
   if(keyCode==UP){
     if(num < movers.length){
       movers[num]=new Mover();
       num++;
     }else{
      //somehow alert too much 
     }
   }else if(keyCode == DOWN){
     if(num > 1){
       movers[num-1]=null;
       num--;
     }else{
      //somehow alert too few
     }
   }
   
}

