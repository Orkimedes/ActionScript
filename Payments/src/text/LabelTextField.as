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
		
		public function LabelTextField() 
		{
			var beforeText:TextField = new TextField();
			var nowText:TextField = new TextField();
			var differenceText:TextField = new TextField();
			var resultText:TextField = new TextField();
			var totalSumText:TextField = new TextField();
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
			createLabels();
			
		}
		
		public function createLabels():void 
		{
			addChild(beforeText);
			addChild(nowText);
			addChild(differenceText);
			addChild(resultText);
			addChild(totalSumText);
		}
		
		
	}

}