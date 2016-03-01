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
		
		public static function calculateElectricity(a:String, b:String, event:MouseEvent):String
		{
			
		}
		
		private function _calculateElectricity(event:MouseEvent):void
		{
			var result:Number;
			var a:Number = Number(inputElectricityPrevious.text);
			var b:Number = Number(inputElectricityCurrent.text);
			var difference:Number = Number(b - a);
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
		}
		
	}
	

}