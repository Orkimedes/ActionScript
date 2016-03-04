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
		}
		
		public function get dif():Number 
		{
			return _dif;
		}
		
		public function get cost():Number 
		{
			return _cost;
		}
		
		
	}

}