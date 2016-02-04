//Helen Zhang, Block 8, Magic Eight 
//https://af145660c45c84efa63a53e56a05950e7189826e.googledrive.com/host/0B24E0vgcnJ6PU2UzdGllTHhTVEk/index.html

boolean isAnswering;
int choose;
float y;
float x = 0;
PImage questionMark;

void setup() {
  size(300, 300);
  noStroke();
  isAnswering = false;
  questionMark = loadImage("QuestionMark.png");
}

void draw() {

  background(88,192,255);

  fill(247,182,50);
  rect(0, 230, 300, 70);
 
  int b = 0;
  while(b < 301){
    fill(105,219,7);
    ellipse(b, 230, 17, 17);
    b += 15;
  }

  magicBox();
  x += .03;
  y=-5+40*sin(x);
}

void mousePressed() {
  if ( get(mouseX, mouseY) != color(88,192,255) ) {
    isAnswering = !isAnswering;
    choose = int(random(16));
  }
}



void magicBox() {


  if (isAnswering == true) {
    openedBox();
    answer();
  } else {
    //front
    fill(247, 216, 57);
    rect(80, 80+y, 100, 100);
    //side
    fill(157, 138, 40);
    quad(180, 80+y, 220, 60+y, 220, 160+y, 180, 180+y);
    //top
    fill(255, 240, 106);
    quad(80, 80+y, 120, 60+y, 220, 60+y, 180, 80+y);

    image(questionMark, 80, 80+y, 100, 100);
  }
}

void openedBox() { 
  //top
  fill(100);
  quad(80, 80+y, 120, 60+y, 220, 60+y, 180, 80+y);
  //inside
  fill(75);
  triangle(80, 80+y, 120, 60+y, 120, 80+y);

  //front
  fill(149, 85, 20);
  rect(80, 80+y, 100, 100);
  //side
  fill(124, 70, 20);
  quad(180, 80+y, 220, 60+y, 220, 160+y, 180, 180+y);
}

void answer() {
  String answers[] = loadStrings("answers.txt"); 
  fill(#FF4400);
  textAlign(CENTER);
  textSize(20);
  text(answers[choose], 150, 275);
}


