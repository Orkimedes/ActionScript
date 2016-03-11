package text 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class TextBlock extends Sprite 
	{
		private var labelTextField:TextField;
		private var interactiveTextField:TextField;
		private var labelFormat:TextFormat = new TextFormat();//?????
		private var interactiveTextFormat:TextFormat = new TextFormat();
		
		public function TextBlock(coords:Point, width:Number, height:Number, textLabel:String) 
		{
			super();
			labelTextField = new TextField;
			labelTextField.text = textLabel;
			addChild(labelTextField);
			
			interactiveTextField = new TextField;
			addChild(interactiveTextField);
			
			interactiveTextField.x = coords.x;
			interactiveTextField.y = coords.y;
			interactiveTextField.width = width;
			interactiveTextField.height = height;
			
			interactiveTextField.border = true;
			interactiveTextField.background = true;
			interactiveTextField.backgroundColor = 0x2A5699;
		
			
		}
		
	}

}