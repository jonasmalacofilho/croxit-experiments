package build.yaml;
import yaml.Yaml;
import yaml.util.ObjectMap;

class BuildFile
{
    var data : AnyObjectMap;

    public function new(filename : String)
    {
        data = Yaml.read(filename);  
    }

    public function getPackage()
    {
        return data.get("package");
    }

    public function getPlatform()
    {
        return data.get("platform");
    }

    public function getSDKVersion()
    {
        return data.get("sdk_version");
    }

    public function getVersionCode()
    {
        return Std.parseInt(data.get("version_code"));
    }

    public function getVersionName()
    {
        //TODO: Better name
        return data.get("version_name");
    }

    public function getAppName()
    {
        return data.get("appname");
    }
    public function getMain()
    {
        return data.get("main");
    }

}