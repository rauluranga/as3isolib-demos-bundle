package  
{

	/**
	 * @author Raul Uranga
	 */
	public class Grid 
	{
		public var map:Array;
		public var xpos:int = 0;
		public var ypos:int = 0;

		public function Grid() 
		{
			map = [  [1,1,1,1,1,1,1,1],
			         [1,0,0,0,0,0,0,1],
			         [1,0,1,0,0,1,0,1],
			         [1,0,1,1,0,1,0,1],
			         [1,0,0,0,0,1,0,1],
			         [1,0,1,0,1,1,0,1],
			         [1,0,0,0,0,0,0,1],
			         [1,1,1,1,1,1,1,1] ];
		}
		
		public function update():void
		{
			
		}
		
		public function getCell(x:int,y:int):int
		{
			return int(map[x][y]);	
		}
		
		public function getIsWalkable(x:int,y:int):Boolean
		{
			return getCell(x, y) < 0;
		}
	}
}
