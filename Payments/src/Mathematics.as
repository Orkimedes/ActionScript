package 
{
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Nikk
	 */
	public class Mathematics 
	{
		
		public function Mathematics() 
		{
			
		}
		
		public static function calculateElectricity(a:String, b:String):CalculationResult
		{
			var result:Number;
			var _a:Number = convertToNumber(a);
			var _b:Number = convertToNumber(b);
			var difference:Number = (_b-_a);
			var LOWPRICE:Number = .456;
			var MIDPRICE:Number = .789;
			var LIMIT:Number = 100;
			
			if (difference > LIMIT)
			{
				result = LOWPRICE * LIMIT + (difference - LIMIT) * MIDPRICE;
			}
			else 
			{
				result = (difference) * LOWPRICE;
			}
			
			return new CalculationResult(difference, result);
		}
		
		private static function convertToString():void
		{
			
		}
		
		
		public static function convertToNumber(text:String,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(Number(text) * radix) / radix;
		}
		
		
		
	}
	

}