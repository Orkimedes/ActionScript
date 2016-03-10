package
{
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class CalculationResult
	{
		private var _dif:Number;
		private var _cost:Number;
		
		public function CalculationResult(dif:Number, cost:Number)
		{
			_dif = dif;
			_cost = cost;
			trace ('CR created');
		}
		
		public function get dif():Number 
		{
			trace ("get dif");
			return _dif;
			
		}
		
		public function get cost():Number 
		{
			trace("get cost");
			return _cost;
		}
		
		
	}

}