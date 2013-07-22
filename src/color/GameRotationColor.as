package
color{
	import starling.display.DisplayObject;
	import starling.text.TextField;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.display.Quad;

	/**
	 * @author yangshousen
	 */
	public class GameRotationColor extends Sprite
	{
		private var q : Quad;
		
		private var r : Number = 255;
		private var g : Number = 255;
		private var b : Number = 255;
		
		private var rDeat : Number = 0;
		private var gDeat : Number = 0;
		private var bDeat : Number = 0;
		
		private var s : Sprite;

		public function GameRotationColor()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			resetColors();
			
			stage.color = 0x123456;
			
			q = new Quad( 200, 200 );
			
			s = new Sprite();
			
			var txt : TextField = new TextField( 100, 20, "Hello Starling", "Arial", 14, 0xFFFFFF );
			
			s.addChild( q );
			s.addChild( txt );
			
			s.pivotX = s.width >> 1;
			s.pivotY = s.height >> 1;
			
			s.x = ( stage.stageWidth - s.width >> 1 ) + ( s.width >> 1 );
			s.y = ( stage.stageHeight - s.height >> 1 ) + ( s.height >> 1 );
			addChild( s );
			
			s.addEventListener( Event.ENTER_FRAME, onFrame );
		}

		private function onFrame( event : Event ) : void
		{
			r -= ( r - rDeat ) * .05;
			g -= ( g - gDeat ) * .05;
			b -= ( b - bDeat ) * .05;
			
			var color : uint = r << 16 | g << 8 | b;
			q.color = color;
			
			q.alpha = 0.5;
			
			if ( Math.abs( r - rDeat ) < 1 && Math.abs( g - gDeat ) < 1 && Math.abs( b - bDeat ) < 1 )
				resetColors();
				
			( event.target as DisplayObject ) .rotation += .01;
//			s.rotation += .01;
		}
		
		private function resetColors() : void
		{
			rDeat = Math.random() * 255;
			gDeat = Math.random() * 255;
			bDeat = Math.random() * 255;
		}
	}
}