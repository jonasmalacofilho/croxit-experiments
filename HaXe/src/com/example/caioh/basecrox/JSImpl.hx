package com.example.caioh.basecrox;

import android.content.Context;
import android.widget.Toast;

class JSImpl {

var ctx : Context;

public function new(c : Context)
{
    this.ctx = c;
}

@:strict(android.webkit.JavascriptInterface)
public function showMessage(msg : String)
{
    Toast.makeText(ctx, msg, Toast.LENGTH_SHORT).show();
}

}
