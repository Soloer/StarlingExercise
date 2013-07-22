package img
{
	import flash.geom.Point;
	import starling.textures.TextureSmoothing;
	import starling.display.DisplayObject;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.utils.deg2rad;

	import flash.display.Bitmap;

	/**
	 * @author SoloerYoung
	 */
	public class MyImgTestGame extends Sprite
	{
		[Embed(source="../assets/character/unknown.jpg")]
		private var bmpClazz : Class;
		private const NUM_SAUSAGES : uint = 1000;
		private var sausagesVector : Vector.<CustomImage> = new Vector.<CustomImage>( NUM_SAUSAGES, true );
		
		public function MyImgTestGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			stage.color = 0x123456;
			var sausageBitmap : Bitmap = new bmpClazz();
			
			var texture : Texture = Texture.fromBitmap( sausageBitmap );
			
			for (var i : int = 0; i < NUM_SAUSAGES; i++) 
			{
				var image : CustomImage = new CustomImage( texture);
				image.smoothing = TextureSmoothing.TRILINEAR;
				image.alpha = ( int( Math.random() * 9 + 1 ) ) * 0.1;
				
				image.color = 0xFFFF00;
				
				image.destX = Math.random() * stage.stageWidth;
				image.destY = Math.random() * stage.stageHeight;
				
				image.pivotX = image.width >> 1;
				image.pivotY = image.height >> 1;
				
				image.x = Math.random() * stage.stageWidth;
				image.y = Math.random() * stage.stageHeight;
				image.rotation = deg2rad( Math.random() * 360 );
				
				addChild( image );
				sausagesVector[i] = image;
			}
			
			stage.addEventListener( Event.ENTER_FRAME, onRender );
			stage.addEventListener( TouchEvent.TOUCH, onClick );
		}

		private function onClick( event : TouchEvent ) : void
		{
			var touches : Vector.<Touch> = event.getTouches( this, TouchPhase.ENDED );
			
			if( touches && touches.length == 1 )
			{
				var clicked : DisplayObject = event.currentTarget as  DisplayObject;
//				var touch : Touch = touches[0];
				trace( clicked, event.target, event.bubbles );
			}
			
			
		}

		private function onRender( event : Event ) : void
		{
			var len : uint = sausagesVector.length;
			var image : CustomImage;
			for (var i : int = 0; i < len; i++) 
			{
				image = sausagesVector[i];
				image.x -= ( image.x - image.destX ) * .1;
				image.y -= ( image.y - image.destY ) * .1;
				
				if ( Math.abs( image.x - image.destX ) < 1 && Math.abs( image.y - image.destY ) < 1 )
				{
					image.destX = Math.random() * stage.stageWidth;
					image.destY = Math.random() * stage.stageHeight;
					image.rotation = deg2rad( Math.random() * 360 );
				}
			}
		}
	}
}
