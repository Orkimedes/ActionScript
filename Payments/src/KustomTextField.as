package 
{
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	public class KustomTextField 
	{
		
		public static function createKustomTF(xPosition:Number, yPosition:Number, width:Number, height:Number, type:String = TextFieldType.DYNAMIC):TextField
		{
			var textField:TextField = new TextField();
			
			setTo(textField, xPosition, yPosition, width, height);
			textField.type = type;
			textField.border = true;
			textField.background = true;
			textField.backgroundColor = 0xFAD4DB;
			
			return textField;
		}
		
		public static function setTo(displayObject:DisplayObject, x:Number, y:Number, width:Number, height:Number):void // разбили функцию на две части для удобства
		{
			displayObject.x = x;
			displayObject.y = y;
			displayObject.width = width;
			displayObject.height = height;
		}
		
	}

}