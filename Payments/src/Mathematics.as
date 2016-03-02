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
		
		public static function calculateElectricity(a:String, b:String):String
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
			outputElectricityCost.text = String(result);
			outputElectricityDifference.text = String(difference);
			
			return String(result)
		}
		
		
		
	}
	

}