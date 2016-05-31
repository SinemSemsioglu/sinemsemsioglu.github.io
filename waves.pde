// Sinem Semsioglu
// modified from
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

float startAngle = 0;
float angleVel = 0.1;
float currY = 0;
int num;
float amp;
float[] angles;


void setup() {
  size(500,500);
  num = 30;
  amp = 10;
  angles = new float[num];
}

void draw() {
  background(250,235,215);

  //In order to move the wave, we start at a different theta value each frame.  startAngle += 0.02;
  for(int k=0; k<num; k++){
    angles[k] = startAngle;
  }
 
  
  translate(0,height/5);

 
  for(int i=0; i<num; i++){
    //superposing three waves.
    float y1 = map(sin((angles[i])*3/2+ i*PI/6),-1,1,0,amp);
    float y2 = map(sin((angles[i])+i*PI/6),-1,1,0,amp/2);
    float y3 = map(sin((angles[i])/2+i*PI/6),-1,1,0,amp/2);
   
    noStroke();
    
    //calculating the color in relation to where it is on the screen - a shade of blue
    color coll = color(i*4,50+i*5,200+(i/2));
    fill(coll);

    //beginning of the wave shape it goes from bottom of the scrren to the sine wave and back to where it started
    beginShape();
    vertex(0,y1+y2+y3+currY);
    
    //calculating x vertices, to rake reference from
    for (int x = 0; x <= width; x +=2) {
      y1 = map(sin((angles[i])*3/2+ i*PI/6),-1,1,0,amp);
      y2 = map(sin((angles[i])+i*PI/6),-1,1,0,amp/2);
      y3 = map(sin((angles[i])/2+i*PI/6),-1,1,0,amp/2);
      
      vertex(x,y1+y2+y3+currY);
      // translate(0,0,-(z1+z2+z3));
       angles[i] += angleVel*0.07*(i%3+1);
      
    }
    //completes the rest of the shape
    vertex(width,y1+y2+y3+currY);
    vertex(width,height);
    vertex(0,height);
    vertex(0,y1+y2+y3+currY);
  
    endShape();
    currY += height*2/(3*num);
    
    
    
  }
  
  currY = 0;
  startAngle += 0.1;
}

//to manipulate the amplitude
void keyPressed(){
  if(keyCode == UP){
    if(amp<150) amp++;
  }else if(keyCode == DOWN){
    if(amp>-30) amp--;
  }
}

