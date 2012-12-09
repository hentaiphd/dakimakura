package{
    import org.flixel.*;

    public class FallingSprite extends FlxSprite{

        private var fallingsprite:FlxSprite;
        public var timeAlive:int;

        public function FallingSprite(x:int){
            super(30,30);
            this.makeGraphic(10, 10, 0x4E0B1FFF);

            this.x = x;
            this.y = 0;

            var fallSpeed:uint = 100;
            drag.x = fallSpeed*5;
            drag.y = fallSpeed*5;

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
