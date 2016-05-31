import java.util.*;

ArrayList<ParticleSystem> ticles;
int num;

void setup(){
  size(500,500);
  ticles = new ArrayList<ParticleSystem>();
  num = 5;
  x_offset = 50;
  for(int i=0; i<num; i++){
   ticles.add(new ParticleSystem(new PVector(x_offset+40+(80*i),height/2), 40)); 
  }
}

void draw(){
  back();
  //iterates through particle systems to display
  for(ParticleSystem p: ticles){
    //checks if the object is shattered (clicked on)
    if(p.shattered){
     p.run();
   }else p.display();
  }
  
}

//for shattering
void mouseClicked(){
 for(ParticleSystem p: ticles){
  if(p.clicked(mouseX,mouseY)){
    p.shattered = true;
    p.shatter();
  }
 }
}

//for resetting
void keyPressed(){
  if(keyCode == DOWN){
    ticles = new ArrayList<ParticleSystem>();
    x_offset = 50;
    for(int i=0; i<num; i++){
     ticles.add(new ParticleSystem(new PVector(x_offset+40+(80*i),height/2), 40)); 
    }
  }
}
  
 //draws background
void back(){
 background(255);
 rectMode(CORNER);
 fill(0);
 rect(0,0,width,height/4);
 rect(0,height*3/4,width,height);
}

class Particle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float lifespan;


  Particle(PVector l) {
    location = l.get();
    acceleration = new PVector(random(-0.1,0.1),random(-0.3,0.3));
    velocity = new PVector(0,0);
    lifespan = 255;
    mass = 8;
    
  }
  
   Particle(PVector l, float m) {
    location = l.get();
    acceleration = new PVector(random(-0.1,0.1),random(-0.3,0.3));
    velocity = new PVector(0,0);
    lifespan = 255;
    mass = m;
    
  }

  //updates velocity and location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
  

  void display() {
    noStroke();
    rectMode(CENTER);
    fill(200,100,50,lifespan);
    rect(location.x,location.y,mass,mass);
  }
  
  void run(){
   update();
   display();
  }
  
  //applies force to the particle, affects acceleration
  void applyForce(PVector force){
   acceleration.add(force); 
  }
  
  //checks id a particle's lifespan has ended and has become invisible
  boolean isDead(){
     if(lifespan < 0.0) {
       return true; 
     }else return false;
  }
}
class ParticleSystem {
 ArrayList<Particle> particles;
 PVector origin;
 
 float mass;
 boolean shattered;      //checks if the object has been shattered/clicked on
 
 ParticleSystem(PVector origin_){
  particles = new ArrayList<Particle>(); 
  origin = origin_;
  shattered = false;
  mass = 0;
 }
 
 ParticleSystem(PVector origin_, float mass_){
  particles = new ArrayList<Particle>(); 
  origin = origin_;
  shattered = false;
  mass = mass_;
 }
 
 void addParticle(){
  particles.add(new Particle(origin)); 
 }
 
 //adds particle to a given position
 void addParticle(Particle p){
  particles.add(p); 
 }
 
 //shatters the particles accross the scrren
 void run(){
   Iterator<Particle> parts = particles.iterator();
   Particle curr; 
   while(parts.hasNext()){
     curr = parts.next();
     curr.run();
     if (curr.isDead()){
      parts.remove(); 
     }
   }
 }
 
 void display(){
  rectMode(CENTER);
  noStroke();
  fill(200,100,50);
  rect(origin.x, origin.y, mass, mass);
 }
 
//checks if a particle system has been clicked 
boolean clicked(int mx, int my) {
    float d = dist(mx,my,origin.x,origin.y);
    if (d < mass) {
      return true;
    }
    return false;
 }
 
 //initializes a list of particles with their total mass equal to the objects
 void shatter(){
  float m=0;
  while(m<mass*mass){
    float moverMass = random(5,mass/3);
    PVector moverPos = PVector.add(origin, new PVector(random(-mass/2,mass/2),random(-mass/2, mass/2)));
    particles.add(new Particle(moverPos,moverMass)); 
    m+=moverMass*moverMass;
  }
 }
}

