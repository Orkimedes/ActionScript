package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import text.CustomTextField;
	
	[SWF(width="800", height="600")]
	public class Main extends Sprite 
	{
		//задаем стандартные значения длины, ширины, расстояния между объектами и стартовой точки
		public static var baseX:Number = 100;
		public static var baseY:Number = 60;
		public static var baseDelta:Number = 30;
		public static var startPointX:Number = 20;
		public static var startPointY:Number = startPointX;
		//
		private var x0:Number = startPointX;
		private var x1:Number = x0+baseDelta+baseX;
		private var x2:Number = x1+baseDelta+baseX;
		private var x3:Number = x2+baseDelta+baseX;
		private var x4:Number = x3+baseDelta+baseX;
		private var x5:Number = x4+baseDelta+baseX;
		
		private var y1:Number = startPointY;
		private var y2:Number = y1+baseY+baseDelta;
		private var y3:Number = y2+baseDelta+baseY;
		private var y4:Number = y3 + baseDelta + baseY;
		private var y5:Number = y4 + baseDelta +baseY;
	
		
		private var btn0:Button = new Button();
		private var btn1:Button = new Button();
		private var btn2:Button = new Button();
		
		private var inputElectricityPrevious     :CustomTextField; //теперь это объект класса CustomTextField, а не TextField, и для них можно использовать методы этого класса
		private var inputElectricityCurrent      :CustomTextField; //объявлены ы этой части кода, чтобы различные функции имели доступ к ним
		private var outputElectricityCost        :CustomTextField;
		private var outputElectricityDifference  :CustomTextField;
		private var inputWaterPrevious           :CustomTextField;
		private var inputWaterCurrent            :CustomTextField;
		private var outputWaterCost              :CustomTextField;
		private var outputWaterDifference        :CustomTextField;
		private var inputGasPrevious             :CustomTextField;
		private var inputGasCurrent              :CustomTextField;
		private var outputGasCost                :CustomTextField;
		private var outputGasDifference          :CustomTextField;
		private var outputTotalSum               :CustomTextField;
		private var testField                    :CustomTextField;
		
		private var inputEl1:Number;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//inputElectricityPrevious.text = '123.456789';
			//trace(inputElectricityPrevious.numericValue);//получаем значение через getter
			//trace(inputElectricityPrevious.getNumericValue(0.1));//вызов метода класса CustomTextField
			//var someValue:Number = inputElectricityPrevious.numericValue
			/*inputElectricityPrevious.text = '123.456789';
			trace(inputElectricityPrevious.numericValue);//получаем значение через getter
			trace(inputElectricityPrevious.getNumericValue(0.1));//вызов метода класса CustomTextField
			var someValue:Number = inputElectricityPrevious.numericValue*/
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//inputs
			inputElectricityPrevious = new CustomTextField(x0, y1, baseX, baseY, TextFieldType.INPUT); //new TextField();
			inputElectricityCurrent = new CustomTextField(x1, y1, baseX, baseY, TextFieldType.INPUT);
			inputWaterPrevious = new CustomTextField(x0, y2, baseX, baseY, TextFieldType.INPUT);
			inputWaterCurrent = new CustomTextField(x1, y2, baseX, baseY, TextFieldType.INPUT);
			inputGasPrevious = new CustomTextField(x0, y3, baseX, baseY, TextFieldType.INPUT);
			inputGasCurrent = new CustomTextField(x1, y3, baseX, baseY, TextFieldType.INPUT);
			//outputs
			outputElectricityDifference = new CustomTextField(x4, y1, baseX, baseY, TextFieldType.DYNAMIC);
			outputElectricityCost = new CustomTextField(x5, y1, baseX, baseY, TextFieldType.DYNAMIC);
			outputWaterDifference = new CustomTextField(x4, y2, baseX, baseY, TextFieldType.DYNAMIC);
			outputWaterCost = new CustomTextField(x5, y2, baseX, baseY, TextFieldType.DYNAMIC);
			outputGasDifference = new CustomTextField(x4, y3, baseX, baseY, TextFieldType.DYNAMIC);
			outputGasCost = new CustomTextField(x5, y3, baseX, baseY, TextFieldType.DYNAMIC);
			//inProgress
			outputTotalSum = new CustomTextField(x5, y4, baseX, baseY, TextFieldType.DYNAMIC);
			testField = new CustomTextField(x5, y5, baseX, baseY, TextFieldType.DYNAMIC);
			
			addChild(inputElectricityPrevious);			
			addChild(inputElectricityCurrent);	
			addChild(outputElectricityCost);	
			addChild(outputElectricityDifference);
			addChild(inputWaterPrevious);	
			addChild(inputWaterCurrent);	
			addChild(outputWaterCost);	
			addChild(outputWaterDifference);			
			addChild(inputGasPrevious);
			addChild(inputGasCurrent);
			addChild(outputGasCost);
			addChild(outputGasDifference);
			addChild(outputTotalSum);
			addChild(testField);
			
			//inputElectricityPrevious.addEventListener(Event.CHANGE, onTxtChange);
			addEventListener(MouseEvent.CLICK, totalSum);
			
			addChild(btn0);
			btn0.addEventListener(MouseEvent.CLICK, calculateElectricity);
			btn0.x = x2; btn0.y = y1;
			btn0.label = "Свет";
			
			/*removeChild(btn0);
			btn0.destroy();
			btn0 = null;*/
			
			addChild(btn1);
			btn1.addEventListener(MouseEvent.CLICK, calculateWater);
			btn1.x = x2; btn1.y = y2;
			btn1.label = "Вода";

			addChild(btn2);
			btn2.addEventListener(MouseEvent.CLICK, calculateGas);
			btn2.x = x2; btn2.y = y3;
			btn2.label = "Газ";

		}
		
		private function calculateElectricity(event:MouseEvent):void
		{
			var result:Number;
			var a:Number = Number(inputElectricityPrevious.text);
			var b:Number = Number(inputElectricityCurrent.text);
			var difference:Number = Number(b - a);
			var LOWPRICE:Number = .456;
			var MIDPRICE:Number = .789
			var LIMIT:Number = 100
			
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
		
		private function calculateWater(event:MouseEvent):void
		{
			var a:Number = Number(inputWaterPrevious.text);
			var b:Number = Number(inputWaterCurrent.text);
			var difference:Number = Number(b - a);
			var PRICE:Number = 9.12;
			var result:Number = Number(PRICE * difference);
			result = getNumericValue(result);
			
			outputWaterCost.text = String(result);
			outputWaterDifference.text = String(difference);
		}
				
		private function calculateGas(event:MouseEvent):void
		{
			var result:Number;
			var a:Number = Number(inputGasPrevious.text);
			var b:Number = Number(inputGasCurrent.text);
			var difference:Number = Number(b - a);
			var LOWPRICE:Number = 3.6;
			var MIDPRICE:Number = 7.188
			var LIMIT:Number = 200
			
			if (difference > LIMIT)
			{
				result = LOWPRICE * LIMIT + (difference - LIMIT) * MIDPRICE;
			}
			else 
			{
				result = (difference) * LOWPRICE;
			}
			result = getNumericValue(result);
			outputGasCost.text = String(result);
			outputGasDifference.text = String(difference);
		}
		
		private function totalSum(event:MouseEvent):void
		{
			var result:Number = Number(outputGasCost.text) + Number(outputElectricityCost.text) + Number(outputWaterCost.text);
			outputTotalSum.text = String(result);
		}
		
		public function getNumericValue(text:Number,precision:Number = 0.01):Number
		{
			var radix:Number = 1 / precision; //default = 100
			return Math.ceil(Number(text) * radix) / radix;
		}
		
		/*private function onTxtChange(e:Event):void
		{
			var x:Number  = Number(inputElectricityPrevious.text);
			inputEl1 = Math.ceil(x * 100) / 100;
			testField.text = String(inputEl1);
		}*/
		
		/*Население, проживающее в жилых домах (в том числе в домах, оборудованных кухонными электроплитами)	 
		– за объем, употребленный до 100 кВт·час электроэнергии в месяц		57,0
		– за объем, употребленный от 100 кВт·час до 600 кВт·час электроэнергии в месяц		99,0
		– за объем, употребленный свыше 600 кВт·час электроэнергии в месяц		156,0*/
		
	}
	
}