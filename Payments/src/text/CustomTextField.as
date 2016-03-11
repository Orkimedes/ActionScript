package text 
{
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author me
	 */
	public class CustomTextField extends TextField 
	{
		private var myTextFormat:TextFormat = new TextFormat();
		public function CustomTextField(coords:Point, width:Number, height:Number, type:String = TextFieldType.DYNAMIC) 
		{
			this.x = coords.x;
			this.y = coords.y;
			this.width = width;
			this.height = height;
			this.type = type;
			border = true;
			background = true;
			backgroundColor = 0x2A5699;
			myTextFormat.align = "center";
			myTextFormat.font = "Tahoma";
			myTextFormat.size = 28;
			myTextFormat.color = 0xe5e5e5;
			myTextFormat.leading = 20;
			defaultTextFormat = myTextFormat;
		}
		
		public function get numericValue():Number// используем getter для того чтобы получить значение
		{
			return Math.ceil(Number(text) * 100) / 100;
		}
		
		public function getNumericValue(text:Number,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(Number(text) * radix) / radix;
		}
		
	}

}

