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


/*Mover[] movers;
int num;
PImage cloud;

void setup(){
 size(500,500);
 num = 5;
 cloud = loadImage("data/clouds.png");
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
       movers[num]=null;
       num--;
     }else{
      //somehow alert too few
     }
   }
   
}*/
/*Mover[] movers;
int num;
PImage cloud;
 /* @pjs preload="/wp-content/uploads/2015/01/birds/clouds.png"; */
/*
void setup(){
 size(500,500);
 num = 5;
 cloud = loadImage("/wp-content/uploads/2015/01/birds/clouds.png");
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
       movers[num]=null;
       num--;
     }else{
      //somehow alert too few
     }
   }
   
}


////////////

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
  
  void updateA() {

    PVector m = new PVector(mouseX,mouseY);
    // Step 1: Compute direction
    PVector dir = PVector.sub(m,location);
    float magg = dir.mag();

    // Step 2: Normalize
    dir.normalize();

    // Step 3: Scale
    dir.mult(0.01*magg);

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
 

}*/

/*Mover m;

void setup(){
  size(400,600);
  background(255);
  m = new Mover();
  //m = new Mover(200,200, 70, 40);
}

void draw(){
  m.updateA();
  background(255);
  m.checkEdges();
  m.display();
}*/
Mover circler;
int radius;
float angle;
int int_nr;
float interval;
float mag;
float zshift;

void setup(){
   size(600,600,P3D);
   background(0);
   zshift = 0;
   radius = 200;
   int_nr = 200;
   interval = PI/(2*int_nr);
   angle = 0;
   //(perimemeter/4 =) quarter /interval
   mag = PI*radius/(int_nr*2);
   
   circler = new Mover((float)width/2, (float)height/2-radius, (float)0, mag*sin(zshift)*sin(angle), mag*sin(zshift)*cos(angle), mag*cos(zshift), (float)0,(float)0, (float) 0, radius);
}

void draw(){
  //circler.update();
    circler.display3d();
    circler.velocity = new PVector(mag*sin(zshift)*sin(angle), mag*sin(zshift)*cos(angle), mag*cos(zshift));
    zshift += interval;
  
  
  
  circler.update();
 
  
}

void mouseClicked(){
  background(0);
   zshift = 0;
   radius = 200;
   int_nr = 200;
   interval = PI/(2*int_nr);
   angle = 0;
   //(perimemeter/4 =) quarter /interval
   mag = PI*radius/(int_nr*2);
   
   circler = new Mover((float)width/2, (float)height/2-radius, (float)0, mag*sin(zshift)*sin(angle), mag*sin(zshift)*cos(angle), mag*cos(zshift), (float)0,(float)0, (float) 0, radius);
}

void keyPressed(){
 /*if(keyCode == DOWN){
   zshift += interval;
 }else */
 
 if(keyCode == RIGHT){
  angle += interval;
 }else if(keyCode == LEFT){
   angle -= interval;
 }
 
 /*else if(keyCode == UP){
    zshift -= interval*2; 
 }*/
  
}
/*Mover runner;

void setup(){
  size(800,300);
  runner = new Mover((float)0,(float)height/2,(float)0,(float)0,(float)0,(float)0, 30); 
}

void draw(){
 background(255);
 runner.update();
 runner.checkEdges();
 runner.display();
}

void keyPressed(){
    if(keyCode == UP){
       runner.acceleration.add(new PVector(0.1, (float)0));
    }else if(keyCode == DOWN){
       runner.acceleration = new PVector(0,0);
       runner.velocity = new PVector(0,0);
    }
  }

*/
/* Mover circler;
int radius;
float angle;
int int_nr;
float interval;
float mag;
float zshift;

void setup(){
   size(600,600,P3D);
   background(0);
   zshift = 0;
   radius = 200;
   int_nr = 20;
   interval = PI/(2*int_nr);
   angle = -PI/2;
   //(perimemeter/4 =) quarter /interval
   mag = PI*radius/(int_nr*2);
   circler = new Mover((float)width/2-radius, (float)height/2, (float)0, (float)mag*cos(angle), (float)mag*sin(angle), (float)0, (float)0,(float)0, (float) 0, radius);
}

void draw(){
  background(0);
   circler.display3d();
  angle += interval;
    //change orientation
   if(angle >= PI/2){
      zshift += interval;
      angle = -PI/2;
      circler.location = new PVector((float)width/2-radius, (float)height/2, (float)0);
      //System.out.println("We're there!");
    }
    if(zshift >PI) noLoop();
    circler.velocity = new PVector(mag*cos(angle),(mag*sin(angle))*cos(zshift),(mag*sin(angle))*sin(zshift)); 
   circler.update(); 
}

*/

