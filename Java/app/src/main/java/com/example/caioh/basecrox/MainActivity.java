package com.example.caioh.basecrox;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.view.KeyEvent;

/**
 * Created by caioh on 14/10/2016.
 */

public class MainActivity extends AppCompatActivity {

    private WebView w;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        w = new WebView(this);
        w.setWebChromeClient(new WebChromeClient());
        w.getSettings().setJavaScriptEnabled(true);
        w.addJavascriptInterface(new JsImpl(this), "Android");
        w.loadData(html(), "text/html", null);

        setContentView(w);
    }

    @Override
    public boolean onKeyDown(int code, KeyEvent evt)
    {
        if(code == KeyEvent.KEYCODE_BACK && w.canGoBack())
        {
            w.goBack();
            return true;
        }

        return super.onKeyDown(code, evt);
    }



    String html()
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
                "   Android.ShowSmthing('blaaa');" +
                "}" +
                "</script></head>" +
                "<body onload='ready()'>" +
                "<h3>Ring ring</h3>" +
                "<h4>Hello!</h4>" +
                "<input type='button' onclick='ShowSmthing();' value='Clickme!'/>" +
                "</body>";
    }

}
