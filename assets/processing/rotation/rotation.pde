int i;
float slowdown;

void setup(){
  size(500,500);
  background(0);
  slowdown = 0.2;
}

void draw(){
  background(0);
  
  translate(width/2,height/2);
  
  fill(255,244,0);
  rotate(slowdown*PI*(1+i)/6);
  rect(20,20,40,40);
  rotate(-slowdown*PI*(1+i)/6);
  
  fill(0,220,220);
  rotate(slowdown*PI*(1-i)/12);
  rect(80,80,30,30);
  rotate(-slowdown*PI*(1-i)/12);
  
  fill(100,255,100);
  rotate(slowdown*PI*(1+i)/24);
  rect(120,120,20,20);
  rotate(-slowdown*PI*(1+i)/24);
  
  i++;
 
  
}

void keyPressed(){
  if(keyCode == UP){
    slowdown+=0.25;
  }else if(keyCode == DOWN){
     slowdown -=0.25; 
  }
}

