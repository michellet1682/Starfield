Particle[] star;
void setup()
{
  size(500,500);
  star = new Particle[300];
  for(int i = 0; i < star.length; i++)
  {
    star[i] = new NormalParticle();
  }
  star[0] = new OddballParticle();
  star[1] = new JumboParticle();
}
void draw()
{
  background(50);
  for(int i = 0; i < star.length; i++)
  {
    star[i].move();
    star[i].show();
  }
}
void mousePressed()
{
  for(int i = 0; i < star.length; i++)
  {
    star[i].reset();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, speed, angle;
  NormalParticle()
  {
    myX = 200;
    myY = 200;
    speed = (double)(Math.random()*4);
    angle = (double)(Math.random()*360);
  }
  public void move()
  {
    myX = myX + Math.cos(angle)*speed;
    myY = myY + Math.sin(angle)*speed;
  }
  public void show()
  {
    noStroke();
    fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    ellipse((float)myX, (float)myY, 5, 5);
  }
  public void reset(){
    myX = 200;
    myY = 200;
    speed = (double)(Math.random()*4);
    angle = (double)(Math.random()*360);
  }
}
interface Particle
{
  public void show();
  public void move();
  public void reset();
}
class OddballParticle implements Particle//uses an interface
{
  int dX, dY;
  double myX, myY, speed, angle;
  OddballParticle()
  {
    myX = (float)(Math.random()*10);
    myY = (float)(Math.random()*10);
    speed = (float)Math.random()*(2*Math.PI);
    angle = (float)(Math.random()*5);
    
    dX = 1;
    dY = 1;
  }
  public void move() 
  {
    if(myX < 10)
    {
      dX=1;
    }
    if(myX > 450)
    {
      dX = -1;
    }
    if(myY < 0)
    {
      dY = 1;
    }
    if(myY > 495)
    {
      dY = -1;
    }
    myX += 4*dX+2;
    myY += 4*dY;
  }
  public void show()
  {
    noStroke();
    fill(255);
    textSize(20);
    text("(-ω-) zzZ ",(float)myX+5, (float)myY);
  }
  public void reset(){
    myX = (float)(Math.random()*10);
    myY = (float)(Math.random()*10);
    speed = (float)Math.random()*(2*Math.PI);
    angle = (float)(Math.random()*5);
    
    dX = 1;
    dY = 1;
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
  public void show()
  {
    fill(250,212,218);
    ellipse((float)myX, (float)myY, 50, 50);
    fill(0);
    text(":>",(float)myX-10, (float)myY+5);
  }
}
