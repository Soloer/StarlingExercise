package flatsprite
{
	import starling.utils.deg2rad;
	import starling.display.Image;
	import starling.textures.Texture;
	import flash.display.Bitmap;
	import starling.events.Event;
	import starling.display.Sprite;

	/**
	 * @author SoloerYoung
	 */
	public class FlatGame extends Sprite
	{
		
		private var container : Sprite;
		private static const NUM_PIGS : uint = 1000;
		[Embed(source="../assets/character/unknown.jpg")]
		private var piaClass : Class;
		
		public function FlatGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			container = new Sprite();
			
			container.pivotX = stage.stageWidth >> 1;
			container.pivotY = stage.stageWidth >> 1;
			
			container.x = stage.stageWidth >> 1;
			container.y = stage.stageHeight >> 1;
			
			var texture : Texture = Texture.fromBitmap( new piaClass() );
			
			for (var i : int = 0; i < NUM_PIGS; i++) 
			{
				var image : Image = new Image( texture );
				image.x = Math.random() * stage.stageWidth;
				image.y = Math.random() * stage.stageHeight;
				image.rotation = deg2rad( Math.random() * 360 );
				
				container.addChild( image );
			}
			addChild( container );
			//flatten后，cpu消耗很少，几乎没有
			container.flatten();
			
			stage.addEventListener( Event.ENTER_FRAME, onRender );
		}

		private function onRender( event : Event ) : void
		{
			container.rotation += .1;
		}
	}
}
