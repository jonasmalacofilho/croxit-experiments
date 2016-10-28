package build;
import haxe.macro.Compiler;

class Pre
{
    static function detectPlatform()
    {
        if(Compiler.getDefine('android') != null)
            return "android";
        else
            return "ios";           
    }

    static function includeLatestJar()
    {
        var v = Android.getPlatforms();
        return Android.getTargetJar(v[0]);
    }


    public static function build()
    {
        var plat = detectPlatform();
        if(plat == 'android')
        {
            var v = includeLatestJar();
            Compiler.addNativeLib(v);
        }
    }
}