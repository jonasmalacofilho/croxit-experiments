package com.example.caioh.basecrox;

import android.content.Context;
import android.webkit.JavascriptInterface;
import android.widget.Toast;

/**
 * Created by caioh on 15/10/2016.
 */
public class JsImpl {

    Context ctx;

    JsImpl(Context c)
    {
        ctx = c;
    }

    @JavascriptInterface
    public void ShowSmthing(String foo)
    {
        Toast.makeText(ctx, foo, Toast.LENGTH_SHORT).show();
    }
}
