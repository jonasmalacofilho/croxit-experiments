package build;
import haxe.macro.Compiler;
import build.yaml.BuildFile;

class Pre
{
    public static function build()
    {
        var build = new BuildFile("./build.yaml");
        var plat = build.getPlatform();
        
        if(plat == 'android')
        {
            var v = Android.getPlatforms();
            var exists = v.indexOf(build.getVersion()) != -1;
            if(exists)
                Compiler.addNativeLib(Android.getTargetJar(build.getVersion()));
            else
            {
                trace("Version " + build.getVersion() + " not found. Using the highest SDK available on your system");
                Compiler.addNativeLib(Android.getTargetJar(v[0]));
            }
        }
    }
}