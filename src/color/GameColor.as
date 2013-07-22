package
color{
	import starling.events.Event;
	import starling.display.Quad;
	import starling.display.Sprite;

	/**
	 * @author yangshousen
	 */
	public class GameColor extends Sprite
	{
		private var q : Quad;

		public function GameColor()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			stage.color = 0x002143;
			
			q = new Quad( 200, 200 );
			q.color = 0x00FF00;
			q.x = stage.stageWidth - q.width >> 1;
			q.y = stage.stageHeight - q.height >> 1;
			
			trace( stage.stageWidth + ":" + stage.stageWidth + " && " + q.x + ":" + q.y );
			
			
			addChild( q );
		}
	}
}
