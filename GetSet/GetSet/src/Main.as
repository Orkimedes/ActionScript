package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
		var myGetSet:GetSet = new GetSet;
		trace (myGetSet.publicAccess);
		myGetSet.publicAccess = 'hello';
		trace (myGetSet.publicAccess);
		
		}
		
	}
	
}