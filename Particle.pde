class Particle extends VerletParticle2D
{
  float r;
  
  Particle(Vec2D loc)
  {
    super(loc);
    r = 5;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r * 4, -1));

  }
  
  void display()
  { 
    color c = color(255);    
    if(x > 0 && x < width && y > 0 && y < height)
    {
      c = pixels[int(x) + width * int(y)];
    }
    
    fill(c);
    noStroke();
    ellipse(x, y, r *2, r *2);
  }
}