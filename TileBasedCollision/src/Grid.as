package  
{

	/**
	 * @author Raul Uranga
	 */
	public class Grid 
	{
		public var map:Array;
		private var char:Char;

		public function Grid() 
		{
			
		}
		
		private function checkCollisions():void 
		{
			var downY:int = Math.floor(( charY + 19 ) / GridConstants.TILE_SIZE) ;
			var upY:int = Math.floor(( charY ) / GridConstants.TILE_SIZE);
			
			var leftX:int = Math.floor(( charX ) / GridConstants.TILE_SIZE);
			var rightX:int = Math.floor(( charX + 19 ) / GridConstants.TILE_SIZE);
			
			if ( getCell(upY, leftX) > 0 || getCell(upY, rightX) > 0 ) {
				charY += GridConstants.SPEED;
			}
			
			if ( getCell(downY, leftX) > 0 || getCell(downY, rightX) > 0 ) {
				charY -= GridConstants.SPEED;
			}
			
			if ( getCell(downY, leftX) > 0 || getCell(upY, leftX) > 0 ) {
				charX += GridConstants.SPEED;
			}
			
			if ( getCell(downY, rightX) > 0 || getCell(upY, rightX) > 0 ) {
				charX -= GridConstants.SPEED;
			}
		}

		public function initialize():void 
		{
			map = [  [1,1,1,1,1,1,1,1],
			         [1,0,0,0,0,0,0,1],
			         [1,0,1,0,0,1,0,1],
			         [1,0,1,1,0,1,0,1],
			         [1,0,0,0,0,1,0,1],
			         [1,0,1,0,1,1,0,1],
			         [1,0,0,0,0,0,0,1],
			         [1,1,1,1,1,1,1,1] ];
			         
			char = new Char();
		}
		
		public function update():void
		{
			checkCollisions();
		}
		
		public function getCell(x:int,y:int):int
		{
			return int(map[x][y]);	
		}
		
		public function getIsWalkable(x:int,y:int):Boolean
		{
			return getCell(x, y) < 0;
		}
		
		public function get charX():int
		{
			return char.xpos;
		}
		
		public function set charX(value:int):void
		{
			char.xpos = value;
		}
		
		public function get charY():int
		{
			return char.ypos;
		}
		
		public function set charY(value:int):void
		{
			char.ypos = value;
		}
	}
}
