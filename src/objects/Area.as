package objects
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class Area extends Sprite
	{
		// setting variables
		// output of the winner of the round
		public static var Player_1_Point:String = "Player 1 scored!";
		public static var Player_2_Point:String = "Player 2 scored!";
		// distance from the sides of the area
		public static var playerDistanceSide:Number = 10;
		public static var playerDistanceTop:Number = 10;
		//keys to move the rackets
		public static var keyW:Number = 87;
		public static var keyS:Number = 83;
		public static var keyO:Number = 79;
		public static var keyL:Number = 76;
		//starting angles of the ball
		private var angle:Number;
		public static var minimunAngle:Number = 20;
		public static var maximumAngle:Number = 40;
		//speed of the rackets
		public static var playerSpeed:Number = 15;
		public static var ballMaxSpeed:Number = 10;
		public var speed:Number = 0;
		public var size:Point;
		

		//initialising the players with the up and down keys, the bal
		private var player_1:Player_1 = new Player_1(keyW, keyS);
		private var player_2:Player_2 = new Player_2(keyO, keyL);
		private var ball:Ball = new Ball();
		//variable in order to set the ball movement
		private var ballvector:Point;
		
		
		public function Area(w:Number, h:Number)
		{
			super();
			// define the parameters of the playfield/area
			graphics.beginFill(0x888888);
			graphics.lineStyle(1, 0x000000);
			graphics.drawRect(0,0,w,h);
			graphics.endFill();
			
			// stores width and height of the area in order to avoid setting always "height" and "width" in the racket position
			size = new Point(width, height);
			
			// resets the postion of the ball and the rackets
			resetGame();
		}
		
		public function resetGame():void {
			//player_1.scaleX = -1; mirrors the x position of the racket. Position x=0 is now on the right top.
			player_1.scaleX = -1;
			//resetting the players on their positions
			player_1.x = player_1.width + playerDistanceSide;
			player_1.y = size.y / 2 - player_1.height / 2;
			addChild(player_1);
			
			player_2.x = size.x - playerDistanceSide - player_2.width;
			player_2.y = size.y / 2 - player_2.height / 2;
			addChild(player_2);
			
			//setting the ball in the center of the area
			ball.x = size.x / 2;
			ball.y = size.y / 2;
			addChild(ball);
			
			// calculates a random starting angle between min angle and min angle * 2
			angle = 10 + ((Math.random() * minimunAngle) + minimunAngle) * (Math.PI/180);
			
			//stores the movement of the ball 
			ballvector = Point.polar(speed, angle);
			
			//defines the direction of the ball in the beginning, up OR down and left OR right
			if(Math.random() < .5)
				ballvector.x *= -1;
			if(Math.random() < .5)
				ballvector.y *= -1;
		}
		
		//event listener in order to start the game by mouseclick or button and stopping the game with the reset function
		public function startGame():void {
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		public function stopGame():void {
			removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
			resetGame();
		}
		
		private function enterFrameHandler(e:Event):void {
			//accelerating starting speed up to the maximum with each frame
			if(speed < ballMaxSpeed)
			{
				ballvector = Point.polar(speed, angle);
				speed += .3;
			}
			
			
			animatePlayers();
			
			//ball moves in the direction of the vector
			ball.x += ballvector.x;
			ball.y += ballvector.y;
			
			// ball collision top
			if(ball.y - ball.radius < 5)
				ballvector.y *= -1;
			// ball collision bottom
			if(ball.y + ball.radius > size.y - 5)
				ballvector.y *= -1;
			
			// ball collision with players_1
			if((ball.x - ball.radius) <= player_1.x)
			{
				if(!(ball.y < player_1.y) && (!(ball.y > player_1.y + player_1.height)))
				{
					ball.x = player_1.x + ball.radius;
					ballvector.x *= -1;
				}
			}
			// ball collision with players_1
			if((ball.x + ball.radius) >= player_2.x)
			{
				if(!(ball.y < player_2.y) && (!(ball.y > player_2.y + player_2.height)))
				{
					ball.x = player_2.x - ball.radius;
					ballvector.x *= -1;
				}
			}
			
			// ball collision with left wall, player 2 wins a point
			if(ball.x - ball.radius < 0)
			{
				dispatchEvent(new Event(Player_2_Point));
				stopGame();
			}
			// ball collision with left wall, player 1 wins a point
			if(ball.x + ball.radius > size.x)
			{
				dispatchEvent(new Event(Player_1_Point));
				stopGame();
			}
		}
		
		//players movement
		private function animatePlayers():void {
			if(player_1.status == Player_1.down)
				if(!(player_1.y > size.y - playerDistanceTop - player_1.height)) 
					player_1.y += playerSpeed;
			if(player_1.status == Player_1.up)
				if(!(player_1.y < playerDistanceTop))
					player_1.y -= playerSpeed;
			if(player_2.status == Player_2.down)
				if(!(player_2.y > size.y - playerDistanceTop - player_2.height)) 
					player_2.y += playerSpeed;
			if(player_2.status == Player_2.up)
				if(!(player_2.y < playerDistanceTop))
					player_2.y -= playerSpeed;
		}
	}
}