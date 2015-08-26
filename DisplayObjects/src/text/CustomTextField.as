package text 
{
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author me
	 */
	public class CustomTextField extends TextField 
	{
		public function CustomTextField(x:Number, y:Number, width:Number, height:Number, type:String = TextFieldType.DYNAMIC) 
		{
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.type = type;
			border = true;
			background = true;
			backgroundColor = 0xFAD4DB;
		}
		
		public function get numericValue():Number
		{
			return Math.ceil(Number(text) * 100) / 100;
		}
		
		public function getNumericValue(precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(Number(text) * radix) / radix;
		}
		
	}

}


/*
 var obj:CustomTextField
 obj.param = 100;
 obj.param2 = 100;

 
 if(obj.isPopup)
 
*/