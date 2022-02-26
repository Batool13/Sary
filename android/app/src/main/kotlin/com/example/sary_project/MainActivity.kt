package com.example.sary_project

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL ="flutter.toast.message.channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{call,result->
if (call.method=="showToast"){
    val msg = call.argument<String>("message")

    showToast(msg!!).show();

}
            else{
                result.notImplemented();
            }
        }
    }

    private fun showToast(message:String): Toast {
        val toast =Toast.makeText( this,message,Toast.LENGTH_LONG)
        return toast;

    }

}
