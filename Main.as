package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Andreas Sjöstrand
	 */
	public class Main extends Sprite 
	{
		//var map:Tiles = new Tiles();
		private var map:Vector.<Vector.<Tiles>> = new Vector.<Vector.<Tiles>>();   //creates the vector that get the sprites
		//private var shipAmount:int = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, resetGame)  //Eventlistener for resetting the game
			
			
			for (var j:int = 0; j < 10; j++) // loops the vector that places the tiles
			{
				var row:Vector.<Tiles> = new Vector.<Tiles>();  //create a vector
				for (var i:int = 0; i < 10; i++)   //loop the sprite class och push it o vector
				{
					var waterTile:Tiles = new Tiles();
					waterTile.x = 20 + j * (waterTile.width + 0.5)
					waterTile.y = 20 + i * (waterTile.height + 0.5)
					row.push(waterTile);
					addChild(waterTile);
					waterTile.addEventListener(MouseEvent.CLICK, splash)
				}
				map.push(row);  // push to vector
			}
			
			PlaceShips();   //use the function PlaceShips wich place the ship on map
		}
		
		private function PlaceShips():void   //generates a ship on a random pos
		{
			var shipSize:int = 3;
			var isHorezontal:Boolean = Math.round(Math.random());
			var shipX:int = 0;
			var shipY:int = 0;
			if (isHorezontal)
			{
				shipX = Math.random() * (10 - shipSize);
				shipY = Math.random() * 10;
				
				for (var i:int = 0; i < shipSize; i++) 
				{
					map[shipX+i][shipY].hasShip = true;
					
				}
			}
			else
			{
				shipY = Math.random() * (10 - shipSize);
				shipX = Math.random() * 10;
				
				for (var i:int = 0; i < shipSize; i++) 
				{
					map[shipX][shipY+i].hasShip = true;
					
				}
			}
		}
		
		
		private function resetGame(e:KeyboardEvent):void    //resets the game
		{
			if (e.keyCode == Keyboard.SPACE) 
			{
				for (var i:int = 0; i < 10; i++) 
				{
					for (var j:int = 0; j < 10; j++) 
					{
						map[i][j].hasShip = false;
					}
				}
				
				PlaceShips();
			}
			
		}
		
		private function splash(e:MouseEvent):void   //replace water tile with splash or explosion tile
		{
			if (e.target.hasShip) 
			{
				Tiles(e.target).ship();
			}
			else 
			{
				Tiles(e.target).splashTiles();
			}
		}
		
	}
	
}