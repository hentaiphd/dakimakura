package
{
    import org.flixel.*;
    [SWF(width="800", height="600", backgroundColor="#000000")]
    [Frame(factoryClass="Preloader")]

    public class dakimakura extends FlxGame{
        public function dakimakura(){
            super(800,600,MenuState,1);
        }
    }
}
