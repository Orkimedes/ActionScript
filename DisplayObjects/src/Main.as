package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import text.CustomTextField;
	
	public class Main extends Sprite 
	{
		private var x1:Number = 20;
		private var x2:Number = 90;
		private var x3:Number = 170;
		private var x4:Number = 330;
		private var x5:Number = 390;
		
		private var y1:Number = 20;
		private var y2:Number = 60;
		private var y3:Number = 100;
		
		private var btn1:Button = new Button();
		private var btn2:Button = new Button();
		private var btn3:Button = new Button();
		
		private var inputElectricityPrevious     :CustomTextField; //теперь это объект класса CustomTextField, а не TextField
		private var inputElectricityCurrent      :TextField;
		private var outputElectricityCost        :TextField;
		private var outputElectricityDifference  :TextField;
		private var inputWaterPrevious           :TextField;
		private var inputWaterCurrent            :TextField;
		private var outputWaterCost              :TextField;
		private var outputWaterDifference        :TextField;
		private var inputGasPrevious             :TextField;
		private var inputGasCurrent              :TextField;
		private var outputGasCost                :TextField;
		private var outputGasDifference          :TextField;
		private var outputTotalSum               :TextField;
		private var testField                    :TextField;
		
		private var inputEl1:Number;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			inputElectricityPrevious = new CustomTextField(x1, y1, 50, 30, TextFieldType.INPUT); //new TextField();
			inputElectricityCurrent = KustomTextField.createKustomTF(x2, y1, 50, 30, TextFieldType.INPUT);
			outputElectricityCost = KustomTextField.createKustomTF(x4, y1, 40, 30, TextFieldType.DYNAMIC);
			outputElectricityDifference = KustomTextField.createKustomTF(x5, y1, 40, 30, TextFieldType.DYNAMIC);
			inputWaterPrevious = KustomTextField.createKustomTF(x1, y2, 50, 30, TextFieldType.INPUT);
			inputWaterCurrent = KustomTextField.createKustomTF(x2, y2, 50, 30, TextFieldType.INPUT);
			outputWaterCost = KustomTextField.createKustomTF(x4, y2, 40, 30, TextFieldType.DYNAMIC);
			outputWaterDifference = KustomTextField.createKustomTF(x5, y2, 40, 30, TextFieldType.DYNAMIC);
			inputGasPrevious = KustomTextField.createKustomTF(x1, y3, 50, 30, TextFieldType.INPUT);
			inputGasCurrent = KustomTextField.createKustomTF(x2, y3, 50, 30, TextFieldType.INPUT);
			outputGasCost = KustomTextField.createKustomTF(x4, y3, 40, 30, TextFieldType.DYNAMIC);
			outputGasDifference = KustomTextField.createKustomTF(x5, y3, 40, 30, TextFieldType.DYNAMIC);
			outputTotalSum = KustomTextField.createKustomTF(x5 - 10, y3 + 40, 50, 30, TextFieldType.DYNAMIC);
			testField = KustomTextField.createKustomTF(x5 - 10, y3 + 80, 50, 30, TextFieldType.DYNAMIC);
			
			inputElectricityPrevious.text = '123.456789';
			trace(inputElectricityPrevious.numericValue);//получаем значение через getter
			trace(inputElectricityPrevious.getNumericValue(0.1));//вызов метода класса CustomTextField
			var someValue:Number = inputElectricityPrevious.numericValue
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
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
			
			addChild(btn1);
			btn1.addEventListener(MouseEvent.CLICK, calculateElectricity);
			btn1.x = x3; btn1.y = y1;
			btn1.label = "Свет";
			
			/*removeChild(btn1);
			btn1.destroy();
			btn1 = null;*/
			
			addChild(btn2);
			btn2.addEventListener(MouseEvent.CLICK, calculateWater);
			btn2.x = x3; btn2.y = y2;
			btn2.label = "Вода";

			addChild(btn3);
			btn3.addEventListener(MouseEvent.CLICK, calculateGas);
			btn3.x = x3; btn3.y = y3;
			btn3.label = "Газ";

		}
		
		private function calculateElectricity(event:MouseEvent):void
		{
			var result:Number;
			var a:Number = Number(inputElectricityPrevious.text);
			var b:Number = Number(inputElectricityCurrent.text);
			var difference:Number = Number(b - a);
			var LOWPRICE:Number = .366;
			var MIDPRICE:Number = .63
			var LIMIT:Number = 100
			
			if (difference > LIMIT)
			{
				result = LOWPRICE * LIMIT + (difference - LIMIT) * MIDPRICE;
			}
			else 
			{
				result = (difference) * LOWPRICE;
			}
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
			outputGasCost.text = String(result);
			outputGasDifference.text = String(difference);
		}
		
		private function totalSum(event:MouseEvent):void
		{
			var result:Number = Number(outputGasCost.text) + Number(outputElectricityCost.text) + Number(outputWaterCost.text);
			outputTotalSum.text = String(result);
		}
		
		/*private function onTxtChange(e:Event):void
		{
			var x:Number  = Number(inputElectricityPrevious.text);
			inputEl1 = Math.ceil(x * 100) / 100;
			testField.text = String(inputEl1);
		}*/
		
		
	}
	
}