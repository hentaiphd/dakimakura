package
{
    import org.flixel.*;

    public class PlayState extends FlxState{

        private var _player:Player;
        private var _fallingsprite:FallingSprite;
        private var time:int;

        override public function create():void{
            FlxG.debug = true;
            FlxG.bgColor = 0xFFFFFFFF;
            FlxG.mouse.show();

            _player = new Player();
            this.add(_player);

            _fallingsprite = new FallingSprite(Math.floor(Math.random()*(1+(FlxG.width))));
            this.add(_fallingsprite);
        }

        override public function update():void{
            time++;
            if(time%20==0){
                _fallingsprite = new FallingSprite(Math.floor(Math.random()*(1+(FlxG.width))));
                this.add(_fallingsprite);
            }

            super.update();
        }
            //private function timeFalling():Number{
            //var t:Number = timedFall * 1;
            //return t
    }
}


