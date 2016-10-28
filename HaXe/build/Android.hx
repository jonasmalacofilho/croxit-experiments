package build;
import sys.*;

class Android
{
    public static function getPlatforms() : Array<String>
    {
        var basePath = Sys.getEnv("ANDROID_HOME");
        if(basePath == null || basePath == "")
            throw "No Android SDK found! Install Android SDK or add 'Android' Enviroment Var pointing to your sdk folder";
        var plat_path = basePath + "/" + "platforms/";
        var plats = FileSystem.readDirectory(plat_path);
        trace(plat_path);
        trace(basePath);
        var versions = new Array<String>();
        for(p in plats)
        {
            if(FileSystem.isDirectory(plat_path + p))
            {
                var ver = p.split("-")[1];
                if(ver != null)
                    versions.push(ver);
            }
        }
        
        versions.sort(function(a, b){
            if(a > b)
                return -1;
            else
                return 1;
        });
        trace(versions);
        return versions;
    }

    public static function getTargetJar(version : String)
    {
        if(version < '14')
            throw "Minimum Android SDK supported is 14";
        var base = Sys.getEnv("ANDROID_HOME");

        return base + "/platforms/android-" + version + "/android.jar";
    }

    


}