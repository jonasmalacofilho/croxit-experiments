package com.example.caioh.basecrox;

import java.Lib;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebChromeClient;


class MainActivity extends Activity {

    private var wv : WebView;

    @:overload
    function onCreate(savedInstanceState : Null<Bundle>)
    {
        wv = new WebView(this);
        wv.setWebChromeClient(new WebChromeClient());
        wv.getSettings().setJavaScriptEnabled(true);

        //NO wv.addJavascriptInterface(new JSImpl(this), "Android") => Assertion Failed =/
        var js = new JSImpl(this);
        wv.addJavascriptInterface(js, "Android");

        wv.loadData(html(), "text/html", null);

        setContentView(wv);
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
                "   Android.showMessage('blaaa');" +
                "}" +
                "</script></head>" +
                "<body onload='ready()'>" +
                "<h3>Ring ring</h3>" +
                "<h4>Hello!</h4>" +
                "<input type='button' onclick='ShowSmthing();' value='Clickme!'/>" +
                "</body>";
    }
}
