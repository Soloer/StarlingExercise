package
color{
	import starling.events.Event;
	import starling.display.Quad;
	import starling.display.Sprite;

	/**
	 * @author yangshousen
	 */
	public class GameFrameColor extends Sprite
	{
		private var q : Quad;
		
		private var a : Number = 125;
		private var r : Number = 255;
		private var g : Number = 255;
		private var b : Number = 255;
		
		private var aDeat : Number = 0;
		private var rDeat : Number = 0;
		private var gDeat : Number = 0;
		private var bDeat : Number = 0;

		public function GameFrameColor()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			resetColors();
			
			stage.color = 0x123456;
			
			q = new Quad( 200, 200 );
			q.color = 0x00FF00;
			q.x = stage.stageWidth - q.width >> 1;
			q.y = stage.stageHeight - q.height >> 1;
			addChild( q );
			var color : uint = a << 24 | r << 16 | g << 8 | b;
			q.color =  color;
			trace( color.toString( 16 ) );
			
//			q.addEventListener( Event.ENTER_FRAME, onFrame );
		}

		private function onFrame( event : Event ) : void
		{
//			a -= ( r - aDeat ) * .05;
			r -= ( r - rDeat ) * .05;
			g -= ( g - gDeat ) * .05;
			b -= ( b - bDeat ) * .05;
			
			var color : uint = r << 16 | g << 8 | b;
			q.color = color;
			
			q.alpha = 0.5;
			
			if ( Math.abs( r - rDeat ) < 1 && Math.abs( g - gDeat ) < 1 && Math.abs( b - bDeat ) < 1 )
				resetColors();
		}
		
		private function resetColors() : void
		{
//			aDeat = Math.random() * 255;
			rDeat = Math.random() * 255;
			gDeat = Math.random() * 255;
			bDeat = Math.random() * 255;
		}
	}
}
