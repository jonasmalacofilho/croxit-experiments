package build.templates.android;
import sys.FileSystem;
import sys.io.File;

class AndroidProject
{
    static var EXPORT_PATH = "./temp/";
    static var BASE_DIR = "./resources/android/";
    
    public static function genDependencies(app_name : String, pkg : String, sdk_version : String, ?version_name : String, ?version_code : Int)
    {
        if(!FileSystem.exists("./temp"))
            FileSystem.createDirectory("temp");

        var read_dir = FileSystem.readDirectory(BASE_DIR);
        for(file in read_dir)
        {
            if(FileSystem.isDirectory(BASE_DIR + file))
                continue;

            var content = File.getContent(BASE_DIR + file);

            var ereg = ~/::([a-zA-Z0-9_]*)::/g;

            var new_content = ereg.map(content, function(reg)
            {
                switch(reg.matched(0))
                {
                    case "::name::":
                        return app_name;
                    case "::package::":
                        return pkg;
                    case "::sdk_version::":
                        return sdk_version;
                    case "::version_name::":
                        return (version_name != null) ? version_name : "1.0";
                    case "::version_code::":
                        return (version_code != null) ? version_code+'' : '0';
                    default:
                        throw "Invalid param : " + reg.matched(0);
                }

            });

            File.saveContent(EXPORT_PATH + file, new_content);
        }    

    }


    //Extra contents
    public static function genOther()
    {
        File.saveContent("temp/settings.gradle", "include ':app'");
        File.copy("./resources/android/build.gradle", "./temp/build.gradle");
    }
}