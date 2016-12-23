class Web
{
    public static var isModNeko(get_isModNeko, null) : Bool;

    public static function get_isModNeko()
    {
        return true;
    }

    public static var isModTora(default, null) : Bool;

    public static function get_isModTora()
    {
        return false;
    }

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
    }

    public static function getClientIP(): String
    {
        return "127.0.0.16";
    }

    public static function getCookies() : Map<String,String>
    {
        var cookieManager = android.webkit.CookieManager.getInstance();
        
        //var cks = cookieManager

        throw "NI";
    }

    public static function setCookies(key : String, value : String, ?expire : Date, ?domain: String, ?path : String, ?secure : Bool)
    {
        throw "NI";
    }

    public static function getCwd() : String
    {
        return android.content.Context.getApplicationContext().getPackageCodePath() + "/www/";
        
    }

    public static function getHostName() : String
    {
        return "localapphost";
    }

    public static function getMethod() : String
    {
        throw "NI";
    }

    public static function getParamValues(param : String) : Array<String>
    {
        throw "NI";
    }

    public static function getParams() : Map<String,String>
    {
        throw "NI";
    }

    public static function getParamsString() : String
    {
        throw "NI";
    }

    public static function getPostData() : String
    {
        throw "NI";
    }

    public static function getURI() : String
    {
        throw "NI";
    }

    public static function logMessage(v : String)
    {
        throw "NI";
    }

    public static function print(str : Dynamic)
    {
        throw "NI";
    }


    public static function parseMultipart(onPart : String ->String -> Void, onData : Bytes -> Int -> Int -> Void) : Void
    {
        throw "Not Implemented";
    }

    public static function getMultipart(maxSize : Int) : Map<String,String>
    {
        throw "Not Implemented";
    }

    public static function redirect(url : String) : Void
    {
        throw "NI";
    }

    public static function setHeader(h : String, v : String) : Void
    {
        throw "NI";
    }

    public static function setReturnCode(r : Int) : Void
    {
        throw "NI";
    }
    
}