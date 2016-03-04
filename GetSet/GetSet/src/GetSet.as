package 
{
	/**
	 * ...
	 * @author Nikk
	 */
	public class GetSet 
	{
		private var privateProperty:String;
		
		public function GetSet() 
		{
			
		}
		
		public function get publicAccess():String
		{
			return privateProperty ;
		}
		
		public function set publicAccess(setValue:String):void
		{
			privateProperty = setValue;
		}
	}

}