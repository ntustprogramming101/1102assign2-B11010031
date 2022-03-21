PImage bgImg, soilImg, lifeImg, groundhogIdleImg,  soldierImg, cabbageImg, gameoverImg,
       startNormalImg, restartNormalImg, startHoverdImg, restartHoverdImg, titleImg, 
       groundhogDownImg, groundhogLeftImg, groundhogRightImg;
boolean downPressed, leftPressed, rightPressed;

//gameState
  final int GAME_START = 0;
  final int GAME_RUN = 1;
  final int GAME_OVER = 2;
  final int GAME_WIN = 3;
  int gameState = GAME_START;

// BUTTON
  final int BUTTON_TOP = 360;
  final int BUTTON_BOTTOM = 420;
  final int BUTTON_LEFT = 248;
  final int BUTTON_RIGHT = 392;
 
int r=floor(random(1,4)); //solderR
int c = floor(random(1,4)); //cabbageX
int d = floor(random(1,4)); //cabbageY

int cabbageX=80*c;
int cabbageY=80*d;

float groundhogIdleX=320;
float groundhogIdleY=80;
float groundhogIdleSpeed = 80;
float groundhogIdleWidth = 80;

int soldierX;
int soldierY=160+80*r;
int life=2;



void setup() {
	size(640, 480, P2D);
  startNormalImg=loadImage("img/startNormal.png");
  restartNormalImg=loadImage("img/restartNormal.png");
  startHoverdImg=loadImage("img/startHovered.png");
  restartHoverdImg=loadImage("img/restartHovered.png");
  titleImg=loadImage("img/title.jpg");
  gameoverImg=loadImage("img/gameover.jpg");
  groundhogDownImg=loadImage("img/groundhogDown.png");
  groundhogLeftImg=loadImage("img/groundhogLeft.png");
  groundhogRightImg=loadImage("img/groundhogRight.png");
  lifeImg=loadImage("img/life.png");
}

void draw() {
  switch(gameState){
   case GAME_START:
       image(titleImg, 0, 0);
       image(startNormalImg, 248, 360);
      if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
        && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
          image(startHoverdImg, 248, 360);
          if(mousePressed){gameState = GAME_RUN;}
          }
        break;

   case GAME_RUN:

    //background
      background(0);
      bgImg=loadImage("img/bg.jpg");
      image(bgImg,0,0);
      
    //soil
      soilImg=loadImage("img/soil.png");
      image(soilImg,0,160);
    
    //grassland
      colorMode(RGB);
      fill(124,204,25);
      noStroke();
      rect(0,145,640,15);
      
    //sun
      colorMode(RGB);
      fill(225,225,0);
      noStroke();
      ellipse(590,50,110,110);
      colorMode(RGB);            //inside
      fill(253,184,19);
      noStroke();
      ellipse(590,50,100,100);
    
    //cabbage
      cabbageImg = loadImage("img/cabbage.png");
       image(cabbageImg,cabbageX,160+cabbageY);
    
    //groundhog
      groundhogIdleImg=loadImage("img/groundhogIdle.png");
      image(groundhogIdleImg,groundhogIdleX,groundhogIdleY);
        
    //solder
       soldierImg=loadImage("img/soldier.png");
         image(soldierImg,soldierX,soldierY);
        soldierX+=10;
        if (soldierX>=640){soldierX=-80;}
     
     //animate
     for(int animate = 0 ; animate < 1 ; animate+=80/15 ){
        if (downPressed){loadImage("img/groundhogDown.png");}
        if (leftPressed){loadImage("img/groundhogLeft.png");}
        if (rightPressed){loadImage("img/groundhogRight.png");}
     }
     //Touch soilder
      if( soldierX <= groundhogIdleX + groundhogIdleWidth 
        && soldierX+80 > groundhogIdleX
        && soldierY < groundhogIdleY+80 
        && soldierY+80 > groundhogIdleY){
          groundhogIdleX=320;
          groundhogIdleY=80;
          life-=1;
          }
        
      //eat cabbage 
      if( cabbageX <= groundhogIdleX + groundhogIdleWidth 
      && cabbageX+80 > groundhogIdleX
      && 160+cabbageY < groundhogIdleY+80 
      && 160+cabbageY+80 > groundhogIdleY){
       cabbageX=1000;
       life+=1;}
       
       // life set
        if(life == 0){
          gameState = GAME_OVER;
          groundhogIdleX=320;
          groundhogIdleY=80;
        }
        if(life == 1){
        image(lifeImg,10,10);}
        if(life == 2){
        image(lifeImg,10,10);
        image(lifeImg,80,10);}
        if(life == 3){
        image(lifeImg,10,10);
        image(lifeImg,80,10);
        image(lifeImg,150,10);}
        
   break;
        
   case GAME_OVER:
       image(gameoverImg, 0, 0);;
       image(restartNormalImg, 248, 360);
         if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
          && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
            image(restartHoverdImg, 248, 360);
            if(mousePressed){
            gameState = GAME_RUN;
            life=2;}
            }
    break;
    }//gameState
          
}
void keyPressed() {
      if (key == CODED){
     switch ( keyCode ){
      case DOWN:
       groundhogIdleY += groundhogIdleSpeed ;
       if(groundhogIdleY + groundhogIdleWidth > height ) 
       groundhogIdleY =height-groundhogIdleWidth;
        downPressed = true;
       break;
      case LEFT:
       groundhogIdleX -= groundhogIdleSpeed;
       if(groundhogIdleX<0) groundhogIdleX=0;
       leftPressed = true;
       break;
      case RIGHT:
       groundhogIdleX += groundhogIdleSpeed;
       if(groundhogIdleX + groundhogIdleWidth > width ) groundhogIdleX = width- groundhogIdleWidth ;
       rightPressed = true;
       break;
       }
      }}
      

void keyReleased() {
   if (key == CODED){
     switch ( keyCode ){
      case DOWN:
       downPressed = false;
       break;
      case LEFT:
       leftPressed = false;
       break;
      case RIGHT:
       rightPressed = false;
       break;}
         }
        }
