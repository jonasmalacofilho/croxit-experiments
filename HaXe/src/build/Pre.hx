package build;
import haxe.macro.Compiler;
import build.yaml.BuildFile;
using haxe.macro.ExprTools;

class Pre
{
    public static var build_file;
    public static function build()
    {
        build_file = new BuildFile("./build.yaml");
        var plat = build_file.getPlatform();
        
        if(plat == 'android')
        {
            var v = Android.getPlatforms();
            trace("aaa");
            var exists = v.indexOf(build_file.getSDKVersion()) != -1;
            trace(build_file.getSDKVersion());
            trace(build_file.getPackage());
            if(exists)
                Compiler.addNativeLib(Android.getTargetJar(build_file.getSDKVersion()));
            else
            {
                //TODO: Warn
                trace("Version " + build_file.getSDKVersion() + " not found. Using the highest SDK available on your system");
                Compiler.addNativeLib(Android.getTargetJar(v[0]));
            }
            var pkg = build_file.getPackage();
        }
    }
}