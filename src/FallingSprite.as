package{
    import org.flixel.*;

    public class FallingSprite extends FlxSprite{

        private var fallingsprite:FlxSprite;
        public var timeAlive:int;

        public function FallingSprite(x:int){
            super(30,30);
            this.color = 0x0000000;

            this.x = x;
            this.y = 0;

            var fallSpeed:uint = 100;
            drag.x = fallSpeed*8;
            drag.y = fallSpeed*8;

            timeAlive = 0;

        }

        override public function update():void{
            super.update();

            timeAlive++;

            this.y = falling();

            if(this.y == 600){
                this.kill();
            }
        }

        private function falling():Number{
            var t:Number = timeAlive * 1;
            return t
        }
    }
}
