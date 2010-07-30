package 
{
	import as3isolib.graphics.SolidColorFill;
	import as3isolib.core.IIsoDisplayObject;
	import as3isolib.display.IsoView;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;

	public class TileBasedCollision extends MovieClip 
	{

		private var box1:IIsoDisplayObject;
		private var scene:IsoScene;
		private var g:IsoGrid;
		private var view:IsoView;
		private var grid:Grid;
		private var xpos:Number;
		private var ypos:Number;
		private var speed:Number;

		public function TileBasedCollision() 
		{
			speed = 5;
			
			scene = new IsoScene();
			
			g = new IsoGrid();
			g.showOrigin = true;
			g.cellSize = GridConstants.TILE_SIZE;
			g.setGridSize(GridConstants.TILE_W, GridConstants.TILE_H, 0);
			scene.addChild(g);
			
			box1 = new IsoBox();
			box1.setSize(20, 20, 20);
			box1.x = xpos = GridConstants.START_X * GridConstants.TILE_SIZE;
			box1.y = ypos = GridConstants.START_Y * GridConstants.TILE_SIZE;
			
			scene.addChild(box1);
			
			buildMap();
			
			
			view = new IsoView();
			view.clipContent = false;
			view.showBorder = false;
			view.setSize(stage.stageWidth, stage.stageHeight);
			view.addScene(scene);
			view.y -= 150;
			
			addChild(view);
			
			renderScene();
						
			Key.initialize(this.stage);
			
			this.addEventListener(Event.ENTER_FRAME, render_handler);
		}

		private function buildMap():void 
		{
			grid = new Grid();
			for ( var i:int = 0;i < GridConstants.TILE_H;++i ) {
				for ( var j:int = 0;j < GridConstants.TILE_W;++j ) {
					if(grid.getCell(i, j)) {
						var box:IsoBox = new IsoBox();
						box.setSize(GridConstants.TILE_SIZE, GridConstants.TILE_SIZE, GridConstants.TILE_SIZE / 4);
						box.x = j * GridConstants.TILE_SIZE;
						box.y = i * GridConstants.TILE_SIZE;
						box.fills = [	
										new SolidColorFill(0x666666, 1), // Top
									    new SolidColorFill(0x999999, 1), // Left
									    new SolidColorFill(0xCCCCCC, 1), // Front
									    new SolidColorFill(0xffffff, .5),// Back
									    new SolidColorFill(0xffffff, .5),// Right
									    new SolidColorFill(0xffffff, .5)//Bottom
									 ];
						scene.addChild(box);
					}
				}
			}
		}

		private function render_handler(evt:Event):void 
		{
			checkKeys();
			checkCollisions();
			moveBox();
			renderScene();
		}

		private function checkKeys():void 
		{
			if(Key.isDown(Keyboard.DOWN)) {
				xpos += speed;
			} else
			if(Key.isDown(Keyboard.UP)) {
				xpos -= speed;
			} else
			if(Key.isDown(Keyboard.LEFT)) {
				ypos += speed;
			} else
			if(Key.isDown(Keyboard.RIGHT)) {
				ypos -= speed;
			}
		}

		private function checkCollisions():void 
		{
			var downY:int = Math.floor(( ypos + 19 ) / GridConstants.TILE_SIZE) ;
			var upY:int = Math.floor(( ypos ) / GridConstants.TILE_SIZE);
			
			var leftX:int = Math.floor(( xpos ) / GridConstants.TILE_SIZE);
			var rightX:int = Math.floor(( xpos + 19 ) / GridConstants.TILE_SIZE);
			
			if ( grid.getCell(upY, leftX) > 0 || grid.getCell(upY, rightX) > 0 ) {
				ypos += speed;
			}
			
			if ( grid.getCell(downY, leftX) > 0 || grid.getCell(downY, rightX) > 0 ) {
				ypos -= speed;
			}
			
			if ( grid.getCell(downY, leftX) > 0 || grid.getCell(upY, leftX) > 0 ) {
				xpos += speed;
			}
			
			if ( grid.getCell(downY, rightX) > 0 || grid.getCell(upY, rightX) > 0 ) {
				xpos -= speed;
			}
		}

		private function moveBox():void 
		{
			box1.x = xpos;
			box1.y = ypos;
		}

		private function renderScene():void 
		{
			scene.render();
		}
	}
}