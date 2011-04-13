//this class creates textfields, which can be used for start button, etc. It is nearly the same like the Player_Score class.

package objects
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Textfield extends MovieClip
	{
		private var writtenText:String;
		private var textField:TextField = new TextField();
		
		public function Textfield(w:Number, h:Number, fontSize:Number)
		{
			super();
			graphics.beginFill(0xffffff);
			graphics.drawRect(0,0,w,h);
			graphics.endFill();
			
			textField.defaultTextFormat = new TextFormat("Arial", fontSize);
			textField.selectable = false;
			addChild(textField);
		}
		
		//getter and setter methods
		
		public function get text():String
		{
			return writtenText;
		}
		
		public function set text(entry:String):void
		{
			writtenText = entry;
			textField.text = writtenText;
		}
		
	}
}