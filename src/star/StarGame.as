package star
{
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * @author SoloerYoung
	 */
	public class StarGame extends Sprite
	{
		private const STAR_MUM : uint = 300;
		
		public function StarGame()
		{
			addEventListener( Event.ADDED_TO_STAGE, addStage );
		}

		private function addStage( event : Event ) : void
		{
			stage.color = 0x123456;
			for (var i : int = 0; i < STAR_MUM; i++) 
			{
				var ran : Number = Math.random();
				var color : uint = ran * 0xFFFFFF;
				var radius : uint = ran * 20 + 1;
				var alapa : Number = ( ran * 9 + 1 ) * 0.1;
				
				trace( color + ':' + radius + ':' + alapa );
				
				var customstar : CustomStar = new CustomStar(color, radius, alapa);
				var x : Number = Math.random() * stage.stageWidth;
				var y : Number = Math.random() * stage.stageHeight;
				customstar.x = x;
				customstar.y = y;
				addChild( customstar );
			}
		}
	}
}
