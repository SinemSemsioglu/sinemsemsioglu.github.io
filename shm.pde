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
  
  Oscillator(color col, PVector velocity, PVector amplitude){
   angle = new PVector();
   this.velocity = velocity;
   this.amplitude = amplitude;
   this.col = col;
  }

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
Oscillator[] osci;
int num;   //max nr of oscillators allowed
int count; //cuurent nr of oscillators
void setup(){
  size(500,500);
  background(255);
  num = 40;
  osci = new Oscillator[num];
  for(int i=0; i<10; i++){
   osci[i] = new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i)); 
  }
  count = 10;
}

void draw(){
  background(255);
  for(int j=0; j<count; j++){
   osci[j].oscillate();
   osci[j].display();
  }
}

void keyPressed(){
 if(keyCode == UP){
   if(count<num){
     int i = count;
     osci[count] = new Oscillator(color(150+2*i,150+2*(20-i),150+2*(10-i)), new PVector(0.05*cos(PI/6*(1+i)), 0.05*sin(PI/6*(1+i))),new PVector(width/20+5*i, height/20+5*i));
     count++;
   }else if(keyCode == DOWN){
     if(count>0){
      osci[count]=null;
      count--;
     }
   }
 }
 
}

