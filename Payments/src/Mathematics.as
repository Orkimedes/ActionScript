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
				result = difference * LOWPRICE;
			}
			
			result = ceilNumber(result);
			
			return new CalculationResult(difference, result);
			
		}
		
		
		public static function calculateWater(previous:Number, current:Number):CalculationResult
		{
			var result:Number;
			var difference:Number = current - previous;
			var PRICE:Number = 11.60;
			
			result = PRICE * difference;
			result = ceilNumber(result);
			
			return new CalculationResult(difference, result);

		}
				
		public static function calculateGas(previous:Number, current:Number):CalculationResult
		{
			var result:Number;
			var difference:Number = current-previous;
			var LOWPRICE:Number = 3.6;
			var MIDPRICE:Number = 7.188
			var LIMIT:Number = 200
			
			if (difference > LIMIT)
			{
				result = LOWPRICE * LIMIT + (difference - LIMIT) * MIDPRICE;
			}
			else 
			{
				result = difference * LOWPRICE;
			}
			result = ceilNumber(result);
			
			return new CalculationResult(difference, result);
		}
		
		/*private static function updateTotalValue():void
		{
			var result:Number = Number(outputGasCost.text) + Number(outputElectricityCost.text) + Number(outputWaterCost.text);
			outputTotalSum.text = String(result);
		}*/
		
		public static function ceilNumber(variable:Number,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(variable * radix) / radix;
		}
		
	}
	

}