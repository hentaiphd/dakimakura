package{
    import org.flixel.*;

    public class Pillow extends FlxSprite{
    public static var sprite:Class;

        public function Pillow(x:int,y:int){
            super(0,500)
            makeGraphic(20, 20, 0x4E0B1FFF);

            this.x = x;

        }

        override public function update():void{
            this.x == x;
            super.update();
        }
    }
}
