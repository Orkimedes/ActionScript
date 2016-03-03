package
{
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class CalculationResult
	{
		private var _dif:int;
		private var _cost:int;
		
		public function CalculationResult(dif:int, cost:int)
		{
			_dif = dif;
			_cost = cost;
		}
		
		public function get dif():int 
		{
			return _dif;
		}
		
		public function get cost():int 
		{
			return _cost;
		}
		
		
	}

}