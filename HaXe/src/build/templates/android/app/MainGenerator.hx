package build.templates.android.app;
import haxe.macro.*;

class MainGenerator
{
    public static function generate(pkg : String, mainClass : String)
    {
        var c = macro class MainActivity extends android.webkit.Activity{
            @:overload
            override function onCreate()
            {
                $i{mainClass}.main();        
                super.onCreate(savedInstanceState);        
            }
        }

        c.pack = ${pkg}.split(".");
        haxe.macro.Context.defineType(c);
    }

    public static function simple(pkg : String, mainClass : String)
    {
        var c = macro class MainActivity extends android.app.Activity
        {
            private var wv : android.webkit.WebView;

            @:overload
            override function onCreate(savedInstanceState : android.os.Bundle)
            {
                wv = new android.webkit.WebView(this);
                wv.setWebChromeClient(new android.webkit.WebChromeClient());
                wv.getSettings().setJavaScriptEnabled(true);
                wv.loadData(html(), "text/html", null);

                setContentView(wv);
                $i{mainClass}.main();
                super.onCreate(savedInstanceState);
            }

            //lazymode
            private function html() : String
            {
                return "<html><head>" +
                        "<script> function ready() " +
                        "{" +
                        "   var p = document.createElement('p'); " +
                        "   var text = document.createTextNode('bla'); " +
                        "   p.appendChild(text); " +
                        "   document.body.appendChild(p);" +
                        "}" +
                        "function ShowSmthing(){" +
                        "   alert('blSDFHKLJIASHGFJLSAHBGMN');" +
                        "}" +
                        "</script></head>" +
                        "<body onload='ready()'>" +
                        "<h3>Ring ring</h3>" +
                        "<h4>Hello!</h4>" +
                        "<input type='button' onclick='ShowSmthing();' value='Clickme!'/>" +
                        "</body>";
            }
        }
        c.pack = ${pkg}.split(".");
        haxe.macro.Context.defineType(c);
    } 
}