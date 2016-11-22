class Web
{
    public static var isModNeko(get_isModNeko, null);

    public static function get_isModNeko()
    {
        return true;
    }

    public static var isModTora(default, null);

    public static function cacheModule(f : Void->Void)
    {
        //For Java, do nothing
        //TODO: Use Android's native ENUM        
    }

    public static function flush()
    {
        //Do nothing;
    }

    public static function getAuthorization() : {user : String, pass : String}
    {
        throw "NI";
    }

    public static function getClientHeader(key : String)
    {
        return switch(key)
        {
            case "host" : "localapphost";
            case "user-agent" : null;
            case "referer" : null;
            default : null;
        }
    }'


    
}