//I built two player classes in order to give several options to the players, for example two different racket pictures, which
//where designed in FLASH... This is even one reason why this class extends MovieClip and not Sprite.

//I know that this is a little bit double coding, but I tried serveral ways and had too many troubles.






package objects
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Player_1 extends MovieClip
	{
		//setting the variables for the keyHandler
		public static var stop_:String = "stop";
		public static var up:String = "moveUp";
		public static var down:String = "moveDown";
		public var status:String = stop_;
		
		private var upKey:Number;
		private var downKey:Number;
		
		public function Player_1(uK:Number, dK:Number)
		{
			super();
			
			//drawing the rackets
			graphics.beginFill(0x0000ff);
			graphics.lineStyle(2, 0xff0000);
			graphics.drawRect(0,0,15,90);
			graphics.endFill();
			
			downKey = dK;
			upKey = uK;
			//setting the stage events and the keyboard events
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandler);
		}
		
		private function keyHandler(e:KeyboardEvent):void {
			if(e.type == "keyDown")
			{
				if(e.keyCode==upKey)
					status = up;
				else if(e.keyCode==downKey)
					status = down;
			}
			//option to stop the racket, but I think it is more interesting, if you have to try to keep the racket in the correct position
			
			else if(e.type=="keyUp")
				if(e.keyCode==upKey || e.keyCode==downKey)
					status = stop_
		}
	}
}