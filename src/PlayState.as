package
{
    import org.flixel.*;

    public class PlayState extends FlxState{

        private var _player:Player;
        private var _fallingsprites:FlxGroup;
        private var _pillows:FlxGroup;
        private var time:int;
        private var boob:FallingSprite;
        private var p:Pillow;

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

            _pillows = new FlxGroup();
            if(FlxG.keys.DOWN){
                p = new Pillow(_player.x, _player.y)
                this.add(p)
                _pillows.add(p);
            }
        }

        override public function update():void{
            time++;
            borderCollide(_player);

            for (var i:Number = 0; i < _fallingsprites.length; i++){
                borderCollide(_fallingsprites.members[i]);
            }

            if(time%50==0){
                boob = new FallingSprite(Math.floor(Math.random()*(1+(FlxG.width))));
                this.add(boob);
                _fallingsprites.add(boob);
                }

            FlxG.collide(_player, _fallingsprites, collisionCallback);
            FlxG.collide(_player, _pillows, collisionCallback2);

            //FlxG.collide(_fallingsprites, _fallingsprites, spritePile);

            if(FlxG.keys.DOWN){
                p = new Pillow(_player.x, _player.y)
                this.add(p)
                _pillows.add(p);
            }

            super.update();
    }

        public function collisionCallback(player:FlxObject, sprite:FallingSprite):void{
            sprite.makeGraphic(10, 10, 0xFFFF0000);
        }

        public function collisionCallback2(sprite:FallingSprite, pillow:Pillow):void{
            sprite.makeGraphic(10, 10, 0xFFFF0000);
            pillow.makeGraphic(20, 20, 0xFFFF0000);
        }

        //public function spritePile(sprite1:FallingSprite, sprite2:FallingSprite):void{
        //}

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




