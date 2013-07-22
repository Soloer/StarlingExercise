package
color{
	import starling.display.DisplayObject;
	import starling.events.TouchPhase;
	import flash.geom.Point;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;

	/**
	 * @author SoloerYoung
	 */
	public class CustomGame extends Sprite
	{
		private var customSprite : CustomSprite;
		private var mouseX : Number = 0;
		private var mouseY : Number = 0;
		
		public function CustomGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			stage.color = 0x123456;
			
			customSprite = new CustomSprite( 200, 200 );
			customSprite.x = ( stage.stageWidth - customSprite.width >> 1 ) + ( customSprite.width >> 1 );
			customSprite.y = ( stage.stageHeight - customSprite.height >> 1 ) + ( customSprite.height >> 1 );
			addChild( customSprite );
			
			stage.addEventListener( Event.ENTER_FRAME, enterFrame );
			stage.addEventListener( TouchEvent.TOUCH, onTouch );
			
			customSprite.addEventListener( TouchEvent.TOUCH, onTouchedSprite );
		}

		private function onTouchedSprite( event : TouchEvent ) : void
		{
			var touch : Touch = event.getTouch( stage, TouchPhase.ENDED );
			var clicked : DisplayObject = event.currentTarget as DisplayObject;
			
			if( touch )
			{
				removeChild( clicked );
			}
		}

		private function onTouch( event : TouchEvent ) : void
		{
			var touch : Touch = event.getTouch( stage, TouchPhase.ENDED );
			
			if ( touch )
			{
				if( !customSprite.contains( event.target as  DisplayObject )  && customSprite.parent == null )
				{
					this.addChild( customSprite );
					customSprite.x = mouseX;
					customSprite.y = mouseY;
				}
				
				var p : Point = touch.getLocation( stage );
				mouseX = p.x;
				mouseY = p.y;
			}
		}

		private function enterFrame( event : Event ) : void
		{
			customSprite.x -= ( customSprite.x - mouseX ) * .1;
			customSprite.y -= ( customSprite.y - mouseY ) * .1;
			
			customSprite.onRender();
		}
	}
}
