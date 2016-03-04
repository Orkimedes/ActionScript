package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import text.CustomTextField;
	
	[SWF(width="800", height="600")]
	public class Main extends Sprite 
	{
		//задаем стандартные значения длины, ширины, расстояния между объектами и стартовой точки
		private static var standardWidth:Number = 100;
		private static var standardHeight:Number = 60;
		private static var gap:Number = 30;
		private static var buttonWidth:Number = standardWidth * 2 + gap;
		private static var startPointX:Number = 20;
		private static var startPointY:Number = 20;
		
		public static const columnWidth:Number = standardWidth + gap;
		public static const rowHeight:Number = standardHeight + gap;
		
		//TODO: создать класс который будет по поинтам расставлять текстовые поля. SomeField(point:point)
		//математику в отдельный класс
		
		
		
		/**
		 * Returns new point with coords
		 * <i>Example:
		 * var p:Point = getCoord(1, 1);
		 * trace(p.x, p.y);
		 * </i>
		 * 
		 * @param	columnIndex
		 * @param	rowIndex
		 * @return Point
		 */
		public function getCoord(columnIndex:int, rowIndex:int):Point {
			
			var result:Point = new Point();
			result.x = startPointX + columnWidth * columnIndex;
			result.y = startPointY + rowHeight * rowIndex;			
			
			return result;
		}
	
		
		private var btn0:Button = new Button(buttonWidth,standardHeight);
		private var btn1:Button = new Button(buttonWidth,standardHeight);
		private var btn2:Button = new Button(buttonWidth,standardHeight);
		
		private var inputElectricityPrevious     :CustomTextField; //теперь это объект класса CustomTextField, а не TextField, и для них можно использовать методы этого класса
		private var inputElectricityCurrent      :CustomTextField; 
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
			addEventListener(MouseEvent.CLICK, totalSum);
			
			createTextFields();
			createButtons();
			
			
			
		}
		
		private function createTextFields():void 
		{
			//inputs
			inputElectricityPrevious = new CustomTextField(getCoord(0, 0), standardWidth, standardHeight, TextFieldType.INPUT); //new TextField();
			inputElectricityCurrent = new CustomTextField(getCoord(1, 0), standardWidth, standardHeight, TextFieldType.INPUT);
			inputWaterPrevious = new CustomTextField(getCoord(0, 1), standardWidth, standardHeight, TextFieldType.INPUT);
			inputWaterCurrent = new CustomTextField(getCoord(1, 1), standardWidth, standardHeight, TextFieldType.INPUT);
			inputGasPrevious = new CustomTextField(getCoord(0, 2), standardWidth, standardHeight, TextFieldType.INPUT);
			inputGasCurrent = new CustomTextField(getCoord(1, 2), standardWidth, standardHeight, TextFieldType.INPUT);
			//outputs
			outputElectricityDifference = new CustomTextField(getCoord(4, 0), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			outputElectricityCost = new CustomTextField(getCoord(5, 0), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			outputWaterDifference = new CustomTextField(getCoord(4, 1), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			outputWaterCost = new CustomTextField(getCoord(5, 1), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			outputGasDifference = new CustomTextField(getCoord(4, 2), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			outputGasCost = new CustomTextField(getCoord(5, 2), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			//inProgress
			outputTotalSum = new CustomTextField(getCoord(5, 3), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			testField = new CustomTextField(getCoord(5, 4), standardWidth, standardHeight, TextFieldType.DYNAMIC);
			
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
		}
		
		private function createButtons():void 
		{
			var btn0coords:Point = getCoord(2, 0);
			
			addChild(btn0);
			btn0.addEventListener(MouseEvent.CLICK, calculateElectricity);
			btn0.x = btn0coords.x;
			btn0.y = btn0coords.y;
			btn0.label = "Свет";
			
			/*removeChild(btn0);
			btn0.destroy();
			btn0 = null;*/
			
			var btn1coords:Point = getCoord(2, 1);
			addChild(btn1);
			btn1.addEventListener(MouseEvent.CLICK, calculateWater);
			btn1.x = btn1coords.x;
			btn1.y = btn1coords.y;
			btn1.label = "Вода";
			
			var btn2coords:Point = getCoord(2, 2);
			addChild(btn2);
			btn2.addEventListener(MouseEvent.CLICK, calculateGas);
			btn2.x = btn2coords.x;
			btn2.y = btn2coords.y;
			btn2.label = "Газ";
		}
		
		private function calculateElectricity(event:MouseEvent):void
		{
			var result:Number;
			var a:Number = Number(inputElectricityPrevious.text);
			var b:Number = Number(inputElectricityCurrent.text);
			var difference:Number = Number(b - a);
			var LOWPRICE:Number = .456;
			var MIDPRICE:Number = .789;
			var LIMIT:Number = 100;
			
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
			
			var test:CalculationResult= Mathematics.calculateElectricity(inputElectricityPrevious.text, inputElectricityCurrent.text);
			trace (test.cost);
			trace (test.dif);
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
		
		public static const points:Vector.<Point> = new <Point>[
			new Point(startPointX, startPointY),
			new Point(startPointX, startPointY),		
		];
		
		public function getXPoint(columnIndex:int):Number {
			
			return startPointX + columnWidth * columnIndex;			
		}
		
		public function getYPoint(rowIndex:int):Number {
			
			return startPointY + rowHeight * rowIndex;		
		}
		
		/*private function onTxtChange(e:Event):void
		{
			var x:Number  = Number(inputElectricityPrevious.text);
			inputEl1 = Math.ceil(x * 100) / 100;
			testField.text = String(inputEl1);
		}*/
		
		/*private function init(e:Event = null):void 
		{
			//trace(inputElectricityPrevious.numericValue);//получаем значение через getter
			//trace(inputElectricityPrevious.getNumericValue(0.1));//вызов метода класса CustomTextField
			//var someValue:Number = inputElectricityPrevious.numericValue
			//trace(inputElectricityPrevious.numericValue);//получаем значение через getter
			//trace(inputElectricityPrevious.getNumericValue(0.1));//вызов метода класса CustomTextField
			//var someValue:Number = inputElectricityPrevious.numericValue
			
			//inputElectricityPrevious = new MetricField(getCoord(0, 0));
			//inputElectricityPrevious.editable = true;
			
			//inputElectricityCurrent = new MetricField(getCoord(1, 0));
			//inputWaterPrevious = new MetricField(getCoord(0, 1));
			//inputWaterCurrent = new MetricField(getCoord(1, 1));
			
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(MouseEvent.CLICK, totalSum);
			
			createTextFields();
			createButtons();
		}*/
		
		
		/*Население, проживающее в жилых домах (в том числе в домах, оборудованных кухонными электроплитами)	 
		– за объем, употребленный до 100 кВт·час электроэнергии в месяц		57,0
		– за объем, употребленный от 100 кВт·час до 600 кВт·час электроэнергии в месяц		99,0
		– за объем, употребленный свыше 600 кВт·час электроэнергии в месяц		156,0*/
		
	}
	
}