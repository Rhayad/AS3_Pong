package objects
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Player_2 extends MovieClip
	{
		public static var stop_:String = "stop";
		public static var up:String = "moveUp";
		public static var down:String = "moveDown";
		public var status:String = stop_;
		
		private var upKey:Number;
		private var downKey:Number;
		
		public function Player_2(uK:Number, dK:Number)
		{
			super();
			graphics.beginFill(0xff0000);
			graphics.lineStyle(2, 0x0000ff);
			graphics.drawRect(0,0,15,90);
			graphics.endFill();
			
			downKey = dK;
			upKey = uK;
			
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
			
			
			else if(e.type=="keyUp")
				if(e.keyCode==upKey || e.keyCode==downKey)
					status = stop_;
		}
	}
}