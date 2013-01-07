package{
    import org.flixel.*;

    public class Player extends FlxSprite{
        [Embed(source = '../assets/sprite.jpg')] public static var sprite:Class;

        public function Player(){
            super(0,500,sprite);

            var runSpeed:uint = 10;
            drag.x = runSpeed*80;
            drag.y = runSpeed*80;

            loadGraphic(sprite, false, true, 32, 32, true);

        }

        override public function update():void{
            super.update();

            acceleration.x = 0;
            acceleration.y = 0;

            this.y = 500;

            if(FlxG.keys.LEFT || FlxG.keys.RIGHT){
                if(FlxG.keys.LEFT) {
                    acceleration.x -= drag.x;
                } else if(FlxG.keys.RIGHT){
                    acceleration.x += drag.x;
                    }
                }
            }
        }
    }

