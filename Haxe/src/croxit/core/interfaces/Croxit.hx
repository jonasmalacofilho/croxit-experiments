/**
 *  This is the main Croxit manager, and is used to manipulate the main WebView context.
 **/

interface Croxit
{
    public static var OrientationPortrait = 1;
	public static var OrientationPortraitUpsideDown = 2;
	public static var OrientationLandscapeRight = 3;
	public static var OrientationLandscapeLeft = 4;
	public static var OrientationFaceUp = 5;
	public static var OrientationFaceDown = 6;

    public static var shouldRotateInterface(default, set_shouldRotateInterface):Int->Bool;


    private static function set_shouldRotateInterface(v : Int-> Bool) : Int->Bool;

    public static function init();

    public static function initAndStart(home : String, requestHandler : Void->Void);

    public static function start(home : String, requestHandler : Void->Void);

    public static function hide();

    public static function show();

    public static function close();

    //TODO: Create Enums later
    public static function setErrorHandler(errorHandler : String->String->Void);

    public static function setAllowExternal(v:Bool):Void;

    public static function callJS(js:String):String;


    public static function setBounces(val:Bool):Void;


}