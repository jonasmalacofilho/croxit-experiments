package build.yaml;
import yaml.Yaml;
import yaml.util.ObjectMap;

class BuildFile
{
    static var data : AnyObjectMap;

    public function new(filename : String)
    {
        trace("fuu?");
        data = Yaml.read("build.yaml");
        trace("Whaa?");  
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
        return data.get("version_code");
    }

    public function getVersion()
    {
        //TODO: Better name
        return data.get("version_str");
    }

}