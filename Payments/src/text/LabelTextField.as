package text 
{
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Nikk
	 */
	public class LabelTextField  extends TextField
	{
		private var myTextFormat:TextFormat = new TextFormat();
		
		public function LabelTextField(text:String,coords:Point) 
		{
			this.text = text;
			this.x = coords.x;
			this.y = coords.y;
			myTextFormat.align = "center";
			myTextFormat.font = "Tahoma";
			myTextFormat.size = 28;
			myTextFormat.color = 0xe5e5e5;
			myTextFormat.leading = 20;
			defaultTextFormat = myTextFormat;
		}
		
	}

}