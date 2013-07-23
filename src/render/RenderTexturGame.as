package render
{
	import flash.geom.Point;
	import starling.events.TouchPhase;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.textures.Texture;
	import flash.display.Bitmap;
	import starling.events.Event;
	import starling.display.Image;
	import starling.textures.RenderTexture;
	import starling.display.Sprite;

	/**
	 * @author SoloerYoung
	 */
	public class RenderTexturGame extends Sprite
	{
		private var mRenderTexture : RenderTexture;
		private var mBrush : Image;
		
		[Embed(source="../assets/character/unknown.jpg")]
		private var UnJpg : Class;
		
		public function RenderTexturGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			var brush : Bitmap = new UnJpg();
			var texture : Texture = Texture.fromBitmap( brush );
			
			mBrush = new Image( texture );
			mBrush.pivotX = mBrush.width >> 1;
			mBrush.pivotY = mBrush.height >> 1;
			mBrush.scaleX = mBrush.scaleY = 0.5;
			
			mRenderTexture = new RenderTexture( stage.stageWidth, stage.stageHeight );
			
			var canvas : Image = new Image( mRenderTexture );
			addChild( canvas );
			
			stage.addEventListener( TouchEvent.TOUCH, onTouch );
		}

		private function onTouch( event : TouchEvent ) : void
		{
			var touches : Vector.<Touch> = event.getTouches( stage );
			for each(var touch : Touch in touches) 
			{
				if ( touch.phase == TouchPhase.HOVER || touch.phase == TouchPhase.ENDED )
				{
					continue;
				}
				
				var p : Point = touch.getLocation( stage );
				mBrush.x = p.x;
				mBrush.y = p.y;
				mRenderTexture.draw( mBrush );
				
			}
		}
		
	}
}
