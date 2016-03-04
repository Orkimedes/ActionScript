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
		
		/*пользователь класса GetSet будет использовать то, что похоже на свойство publicAccess, но на самом деле является парой функций методов доступа get и set,
		 * которые воздействуют на закрытое свойство privateProperty.
		 * В следующем примере создается экземпляр класса GetSet, а затем задается значение свойства privateProperty с помощью открытого метода доступа publicAccess.
		Функции get и set также позволяют переопределять свойства, унаследованные от суперкласса, что невозможно выполнить при использовании обычных переменных-членов класса.
		Переменные-члены класса, объявленные с использованием ключевого слова var, не могут переопределяться в подклассе.
		Однако это ограничение не распространяется на свойства, созданные с помощью функций get и set.
		Для функций get и set, унаследованных от суперкласса, можно использовать атрибут override.*/
		 
		 public function Main() 
		{
			var myGetSet:GetSet = new GetSet;
			trace (myGetSet.publicAccess);
			myGetSet.publicAccess = 'hello';
			trace (myGetSet.publicAccess);
		}
		
	}
	
}