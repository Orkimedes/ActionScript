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
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//поиск нужного эл-та массива и выведение его номера в списке
			var soundtracks:Array = ["electronic", "hip-hop", "alternative", "classic"];
			for (var i:int = 0; i < soundtracks.length; i++) {
				trace("Now examing element: " + i);
				if (soundtracks[i] == "hip-hop") {
				trace("hip-hop is the " + (i+1) +" in the list");
				break;
				}
			}
			
			//переменная length и вывод массива при помощи trace
			var mylist:Array = [25, 43, 51];
			trace("Length of myList" + mylist.length);
			trace(mylist);
			
			//использование метода splice
			var months:Array = new Array("January", "Friday", "April", "May", "Sunday", "Monday", "July");
			trace(months);
			months.splice(1, 1);
			trace(months);
			months.splice(1, 0, "February", "March");
			trace(months);
			trace(months.splice(5, 2));
			trace(months);
			var n:int = months.indexOf("July");
			months.splice(n, 0, "June");
			trace(months);
			
			//использование метода concat
			var list1:Array = ["Panda", "Cat"];
			var list2:Array = [[1, 2], ["shit", "happens"]];
			var list3:Array = list1.concat(list2);
			trace(list3);
			
			//многомерные массивы
			var row1:Array = [6, 2.99];
			var row2:Array = [4, 9.99];
			var row3:Array = [1, 59.99];
			var totalAmount:Number = 0;
			var spreadshit:Array = [row1, row2, row3];
			trace(spreadshit.length);
			for (var k:int = 0; k < spreadshit.length; k++) {
				totalAmount += spreadshit[i][0] * spreadshit[i][1];
			}
			trace(spreadshit[0]);
			trace(totalAmount);
			
		}
		
	}
	
}