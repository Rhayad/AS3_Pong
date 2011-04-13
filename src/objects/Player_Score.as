//this class handles the score of the players

package objects
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Player_Score extends MovieClip
	{
		private var playerName:String;
		private var field:TextField;
		
		public function Player_Score(name:String)
		{
			super();
			
			//setting the text font, size
			playerName = name;
			field = new TextField();
			field.defaultTextFormat = new TextFormat("Times New Roman", 18);;
			//avoids selecting and marking the textfield
			field.selectable = false;
			score = 0;
			field.width = field.textWidth + 10;
			addChild(field);
		}
		
		public function set score(value:int):void
		{
			field.text = playerName + " Scoreboard: " + value;
		}
		
	}
}