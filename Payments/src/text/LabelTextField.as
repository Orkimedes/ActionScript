package text 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Nikk
	 */
	public class LabelTextField extends Sprite
	{
		private var beforeText:TextField = new TextField();
		private	var nowText:TextField = new TextField();
		private	var differenceText:TextField = new TextField();
		private	var resultText:TextField = new TextField();
		private	var totalSumText:TextField = new TextField();
			
		public function LabelTextField() 
		{
			
			//
			beforeText.text = 'Предыдущие показания';
			nowText.text = 'Текущие показания';
			differenceText.text = 'Разница';
			resultText.text = 'К оплате';
			totalSumText.text = 'Всего';
			//
			
			//
			beforeText.x = 100;
			beforeText.y = 100;
			//
			//createLabels();
			addChild(beforeText);
			addChild(nowText);
			addChild(differenceText);
			addChild(resultText);
			addChild(totalSumText);
			
		}
		
		public function createLabels():void 
		{
			
		}
		
		
	}

}