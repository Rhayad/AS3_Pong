// Projektarbeit für objektoriente und ereignisgesteuerte Programmierung
// 
// Marcus Kauth
//
//  Description of the main class: The main class only starts the game with the constructor and sets the field for the area

// NOTE: I know that I set many unnecessary comments, but most of them I wrote for myself in order to understand everything a little bit better!

package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import objects.Pong;
	import objects.Textfield;
	
	public class Main extends Sprite
	{	public var startText:Textfield;
		
		public function Main()
		{	
			//sets the coordinate system in the normal position top, left
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			startText = new Textfield(100,20, 12);
			startText.text = "Player 1: W and S";
			startText.x = 300;
			startText.y = 0;
			startText.visible = true;
			addChild(startText);
			
			startText = new Textfield(100,20, 12);
			startText.text = "Player 2: O and L";
			startText.x = 300;
			startText.y = 20;
			startText.visible = true;
			addChild(startText);
			
			//starting the constructor and sets, the size of the area, the multiplayer option and the maximum rounds
			//because of testing the game I just set one round
			var pong:Pong = new Pong(500, 400, false, 3);
			//sets the Position of the Stage
			pong.x = 100;
			pong.y = 100;
			//Stage wird gezeichnet
			addChild(pong);
		}
	}
}