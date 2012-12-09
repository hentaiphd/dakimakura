package{
    import org.flixel.*;

    public class Player extends FlxSprite{
        [Embed(source = '../assets/sprite.jpg')] public static var sprite:Class;

        public function Player(){
            super(0,2,sprite);

            var runSpeed:uint = 10;
            drag.x = runSpeed*80;
            drag.y = runSpeed*80;

            loadGraphic(sprite, false, true, 32, 32, true);

        }

        override public function update():void{
            super.update();
            borderCollide();

            acceleration.x = 0;
            acceleration.y = 0;

            if(FlxG.keys.DOWN || FlxG.keys.UP || FlxG.keys.LEFT || FlxG.keys.RIGHT){
                if(FlxG.keys.LEFT) {
                    acceleration.x -= drag.x;
                } else if(FlxG.keys.RIGHT){
                    acceleration.x += drag.x;
                }

                if(FlxG.keys.UP) {
                    acceleration.y -= drag.y;
                } else if(FlxG.keys.DOWN){
                    acceleration.y += drag.y;
                }

            if(velocity.x == 0 && velocity.y == 0){
                play("idle");
                }
            }
        }

        public function borderCollide():void{
            if(x >= FlxG.width - width)
                x = FlxG.width - width;
            if(this.x <= 0)
                this.x = 0;
            if(this.y >= FlxG.height - height)
                this.y = FlxG.height - height;
            if(this.y <= 0)
                this.y = 0;
        }
    }
}

