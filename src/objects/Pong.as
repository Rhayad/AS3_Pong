//the Pong class coordinates the complete game and its objects area, ball and player.

package objects
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class Pong extends MovieClip
	{
		private var area:Area;
		private var multiPlayer:Boolean;
		private var maxScore:int;
		private var player_1Score:int = 0;
		private var player_2Score:int = 0;
		private var startButton:Textfield;
		private var resumeButton:Textfield;
		private var winButton:Textfield;
		private var player_1Text:Player_Score;
		private var player_2Text:Player_Score;
		
		
		public function Pong(w:Number, h:Number, multi:Boolean, mScore:int)
		{
			super();
			multiPlayer = multi;
			maxScore = mScore;
			//drawing the new area
			area = new Area(w,h);
			area.scaleX = 1;
			area.scaleY = 1;
			addChild(area);
			
			//drawing the the starting button and setting it in the middle position
			startButton = new Textfield(100, 30, 18);
			startButton.text = "Click Button";
			startButton.x = area.width / 2 - startButton.width / 2;
			startButton.y = area.height / 4 - startButton.height / 2;
			addChild(startButton);
			//drawing the the resume button and setting it in the middle position
			resumeButton = new Textfield(100, 30, 14);
			resumeButton.x = area.width / 2 - resumeButton.width / 2;
			resumeButton.y = area.height / 4 - resumeButton.height / 2;
			resumeButton.visible = false;
			addChild(resumeButton);	
			//drawing the the win button and setting it in the middle position
			winButton = new Textfield(100, 30, 14);
			winButton.x = area.width / 2 - winButton.width / 2;
			winButton.y = area.height / 4 + winButton.height * 2;
			winButton.visible = false;
			addChild(winButton);
			
			player_1Text = new Player_Score("Player 1");
			player_1Text.x = area.x;
			player_1Text.y -= 25;
			addChild(player_1Text);
			
			player_2Text = new Player_Score("Player 2");
			player_2Text.x = area.size.x - player_2Text.width;
			player_2Text.y -= 25;
			addChild(player_2Text);
			
			//Event Listener for starting the game, resume and restart the game
			startButton.addEventListener(MouseEvent.CLICK, startGame);
			resumeButton.addEventListener(MouseEvent.CLICK, resumeGame);
			winButton.addEventListener(MouseEvent.CLICK, startGame);
			
			area.addEventListener(Area.Player_1_Point, player_1ScoredHandler);
			area.addEventListener(Area.Player_2_Point, player_2ScoredHandler);
		}
		//function to start a game, player scores set to null, hiding the unused buttons
		private function startGame(e:MouseEvent):void {
			player_1Score = 0;
			player_2Score = 0;
			player_1Text.score = player_1Score;
			player_2Text.score = player_2Score;
			
			area.startGame();
			startButton.visible = false;
			winButton.visible = false;
		}
		//resume the game with the actual score
		private function resumeGame(e:MouseEvent):void {
			area.startGame();
			resumeButton.visible = false;
		}
		
		private function player_1ScoredHandler(e:Event):void {
			player_1Score++;
			player_1Text.score = player_1Score;
			
			if(player_1Score >= maxScore)
			{
				winButton.text = "Player 1 wins !!";
				winButton.visible = true;
			}
			else
			{
				resumeButton.text = "Point: Player 1";
				resumeButton.visible = true;
			}
		}
		
		private function player_2ScoredHandler(e:Event):void {
			player_2Score++;
			player_2Text.score = player_2Score;
			
			if(player_2Score >= maxScore)
			{
				winButton.text = "Player 2 wins !!";
				winButton.visible = true;
			}
			else
			{
				resumeButton.text = "Point: Player 2";
				resumeButton.visible = true;
			}
		}
	}
}