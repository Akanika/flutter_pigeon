package com.example.pigeon_example

import android.content.Context
import android.content.ContextWrapper
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.Pigeon
import java.util.*

class MainActivity: FlutterActivity() {
    private val BATTERY_CHANNEL = "com.amazon.shopping/battery"
    private lateinit var channel: MethodChannel

    private class MyBookApi : Pigeon.BookApi {
        override fun search(keyword: String): MutableList<Pigeon.Book> {
            val random = Random()
            val book = Pigeon.Book()
            book.urlImage = "https://source.unsplash.com/random/?book?sig=" + random.nextInt()
            book.title = java.lang.String.format("Life %s", keyword)

            return Collections.singletonList(book)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BATTERY_CHANNEL)

        channel.setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val arguments = call.arguments() as Map<String, String>?
                val name = arguments?.get("name")

                result.success(getBatteryLevel())
            }

        }
        Pigeon.BookApi.setup(flutterEngine.dartExecutor.binaryMessenger, MyBookApi())
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(application).registerReceiver(null, IntentFilter())
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 1
        }

        return batteryLevel
}
}

