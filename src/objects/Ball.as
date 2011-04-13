//This class defines the ball with radius and color. The ball position is set in the class "Area". 
//That is the reason why the the parameters in the draw function are "0,0"

package objects
{
	import flash.display.MovieClip;
	
	public class Ball extends MovieClip
	{
		public var radius:Number = 25;
		
		public function Ball()
		{
			super();
			graphics.beginFill(0xFFFFFF);
			graphics.lineStyle(1, 0x000000);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}
}