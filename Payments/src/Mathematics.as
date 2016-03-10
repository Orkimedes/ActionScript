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
		
		public static function calculateElectricity(previous:Number, current:Number):CalculationResult
		{
			var result:Number;
			var difference:Number = current - previous;
			var LOWPRICE:Number = .57;
			var MIDPRICE:Number = .99;
			var LIMIT:Number = 100;
			
			if (difference > LIMIT)
			{
				result = LOWPRICE * LIMIT + (difference - LIMIT) * MIDPRICE;
			}
			else 
			{
				result = ceilNumber((difference) * LOWPRICE);
				trace(result);
			}
			
			return new CalculationResult(difference, result);
		}
		
		private static function ceilNumber(variable:Number,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(variable * radix) / radix;
		}
		
		
		
	}
	

}