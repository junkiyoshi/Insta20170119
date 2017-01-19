import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor1;
Attractor attractor2;

VerletPhysics2D physics;

PImage img;

void setup()
{
  size(1024, 1024);
  frameRate(60);
  colorMode(HSB);
  background(0);
 
  physics = new VerletPhysics2D();
  physics.setDrag(0.1);

  particles = new ArrayList<Particle>();
  for(int i = 0; i < 1024; i += 1)
  {
    particles.add(new Particle(new Vec2D(random(width * 0.2, width * 0.8 ), random(height * 0.2, height * 0.8))));
  }
  
  attractor1 = new Attractor(new Vec2D(width/ 4 , height / 4));
  attractor2 = new Attractor(new Vec2D(width/ 4 * 3, height / 4 * 3));
  
}

void draw()
{ 
  loadPixels();
  
  physics.update();

  attractor1.compute(color((frameCount + 128) % 255, 255, 255));
  attractor1.disiplay();
  
  attractor2.compute(color(frameCount % 255, 255, 255));
  attractor2.disiplay();
  
  for(Particle p : particles)
  {
    p.display();
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 3600)
  {
     exit();
  }
  */
}