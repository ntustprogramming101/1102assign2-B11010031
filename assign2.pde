
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
      
