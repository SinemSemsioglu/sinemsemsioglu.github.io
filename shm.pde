// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


class Oscillator  {

  // Using a PVector to track two angles!
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  color col;

 
  Oscillator()  {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    //[offset-down] Random velocities and amplitudes
    amplitude = new PVector(random(width/2),random(height/2));
  }
  
  //initializing an Oscillator object with a given color, vel. and amplitude
  //this constructor is used in this sketch
  Oscillator(color col, PVector velocity, PVector amplitude){
   angle = new PVector();
   this.velocity = velocity;
   this.amplitude = amplitude;
   this.col = col;
  }

  //changes the velocity, thus the movement of the osciallator
  void oscillate()  {
    angle.add(velocity);
  }

  void display()  {
    // Oscillating on the x-axis
    float x = sin(angle.x)*amplitude.x;
    // Oscillating on the y-axis
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(col);
    // Drawing the Oscillator as a line connecting a circle
    line(0,0,x,y);
    noStroke();
    ellipse(x,y,16,16);
    popMatrix();
  }
}
// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

ArrayList<Oscillator> osci; //list of oscillators
int num;   //max nr of oscillators allowed

void setup(){
  size(500,500);
  background(255);
  num = 40;
  osci = new ArrayList<Oscillator>();
  //initialization of the first 10 oscillators with different colors
  for(int i=0; i<10; i++){
    osci.add(new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i))); 
  }
}

void draw(){
  background(255);
  for(Oscillator o: osci){
   o.oscillate();
   o.display();
  }
}

//keyboard interaction. UP to add more oscillators, DOWN to reduce to number of oscillators
void keyPressed(){
 int i = osci.size();
 if(keyCode == UP){
   if(i<num){
     osci.add(new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i)));
   }
 }else if(keyCode == DOWN){
     if(i>0){
      osci.remove(i-1);
     }
 }
 
 
}

