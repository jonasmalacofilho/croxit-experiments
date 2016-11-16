package build.templates.android.app;
import haxe.macro.*;
#if !macro
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebChromeClient;
#end

class MainGenerator
{
    //TODO: Set the correct Arg (Dynamic is a pog =/)
    public macro static function generate(pkg : String, mainClass : Expr)
    {
        var c = macro class MainActivity extends android.webkit.Activity{
            @:overload
            override function onCreate()
            {
                ${mainClass}.main();        
                super.onCreate(savedInstanceState);        
            }
        }

        c.pack = ${pkg}.split(".");
        haxe.macro.Context.defineType(c);

        return macro new MainActivity();
    }

    //TODO: Set the correct Arg (Dynamic is a pog =/)
    public macro static function simple(pkg : String, mainClass : Expr)
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

                //NO wv.addJavascriptInterface(new JSImpl(this), "Android") => Assertion Failed =/
                //var js = new JSImpl(this);
                //wv.addJavascriptInterface(js, "Android");

                wv.loadData(html(), "text/html", null);

                setContentView(wv);
                ${mainClass}.main();
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
                        "   alert('blaaa');" +
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
        
        return macro new com.test.basecrox.MainActivity();
    } 
}