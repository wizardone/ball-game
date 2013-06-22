package lib
{
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.utils.Timer;
	
	public class ballClip extends MovieClip
	{
		const GRAVITY = 0.5;
		
		public var xSpeed:Number;
		public var ySpeed:Number;
		public var hitWall:Number = 0;
		
		private var testBall:MovieClip;

		function ballClip():void
		{
			testBall= new MovieClip();
			testBall.graphics.beginFill(0xff0000 , 1);
			testBall.graphics.drawCircle(20 , 20 , 20);
			testBall.graphics.endFill();
			
			testBall.x = Math.random();
			testBall.y = Math.random();
			
			testBall.buttonMode = true;
			
			xSpeed = Math.random()*5;
			ySpeed = Math.random()*5;
			
			addChild(testBall);
		}
		
		public function step(e:TimerEvent):void
		{
			if (testBall.x > 520)
			{
				xSpeed *= -1;
				testBall.x = 520;
				hitWall++;
				hitCount();
			}
			if (testBall.x < 0)
			{
				xSpeed *= -1;
				testBall.x = 0;
				hitWall++;
				hitCount();
			}
			if (testBall.y  > 370)
			{ 
				ySpeed *= -1;
				testBall.y = 370;
				hitWall++;
				hitCount();
			}
			if (testBall.y < 0)
			{ 
				ySpeed *= -1;
				testBall.y = 0;
				hitWall++;
				hitCount();
			}
			if(testBall.y > 0 || testBall.y < 370)
			{
				ySpeed += GRAVITY;
			}
			
			testBall.x += xSpeed;
			testBall.y += ySpeed;
		}
		
		public function hitCount():void
		{
			trace(hitWall);
		}
	}
}