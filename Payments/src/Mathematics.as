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
			var _a:Number = Number(a);
			var _b:Number = Number(b);
			var difference:Number = b-a;
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
			result = getNumericValue(result);
			
			return new CalculationResult(difference, result);
		}
		
		private static function convertToString()
		{
			
		}
		
		
		public static function convertToNumber(text:Number,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(Number(text) * radix) / radix;
		}
		
		
		
	}
	

}