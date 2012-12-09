package
{
    import org.flixel.*;

    public class PlayState extends FlxState{

        private var _player:Player;
        private var _fallingsprites:FlxGroup;
        private var time:int;
        private var boob:FallingSprite;

        override public function create():void{
            FlxG.debug = true;
            FlxG.bgColor = 0xFFFFFFFF;
            FlxG.mouse.show();

            _player = new Player();
            this.add(_player);

            _fallingsprites = new FlxGroup();
            boob = new FallingSprite(Math.floor(Math.random()*(1+(FlxG.width))));
            this.add(boob)
            _fallingsprites.add(boob);
        }

        override public function update():void{
            time++;
            borderCollide(_player);

            for (var i:Number = 0; i < _fallingsprites.length; i++){
                borderCollide(_fallingsprites.members[i]);
            }

            if(time%20==0){
                boob = new FallingSprite(Math.floor(Math.random()*(1+(FlxG.width))));
                this.add(boob);
                _fallingsprites.add(boob);
                }

            FlxG.collide(_player, _fallingsprites, collisionCallback);

            super.update();
    }

        public function collisionCallback(player:FlxObject, sprite:FallingSprite):void{
            sprite.makeGraphic(10, 10, 0xFFFF0000);
        }

        public function borderCollide(wallSprite:FlxSprite):void{
            if(wallSprite.x >= FlxG.width - wallSprite.width)
                wallSprite.x = FlxG.width - wallSprite.width;
            if(wallSprite.x <= 0)
                wallSprite.x = 0;
            if(wallSprite.y >= FlxG.height - wallSprite.height)
                wallSprite.y = FlxG.height - wallSprite.height;
            if(wallSprite.y <= 0)
                wallSprite.y = 0;
        }
    }
}




