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

    public function getVersion()
    {
        return data.get("version");
    }

}