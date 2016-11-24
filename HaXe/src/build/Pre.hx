package build;
import haxe.macro.Compiler;
import build.yaml.BuildFile;
import build.templates.android.MainGenerator;
import build.templates.android.AndroidProject;
using haxe.macro.TypeTools;

class Pre
{
    public static function build()
    {
        var build_file =  new BuildFile("./build.yaml");
        var plat = build_file.getPlatform();
        
        if(plat == 'android')
        {
            var v = Android.getPlatforms();
            var sdk = build_file.getSDKVersion();
            var exists = v.indexOf(sdk) != -1;
            if(exists)
                Compiler.addNativeLib(Android.getTargetJar(build_file.getSDKVersion()));
            else
            {
                //TODO: Warn
                trace("Version " + build_file.getSDKVersion() + " not found. Using the highest SDK available on your system");
                Compiler.addNativeLib(Android.getTargetJar(v[0]));
            }

            var pkg = build_file.getPackage();
            var main = build_file.getMain();
            var name = build_file.getAppName();
            var version_str = build_file.getVersionName();
            var version_code = build_file.getVersionCode();
            MainGenerator.simple(pkg, main);

            AndroidProject.genDependencies(name,pkg,sdk,version_str,version_code);
            AndroidProject.genOther();
        }
    }
}