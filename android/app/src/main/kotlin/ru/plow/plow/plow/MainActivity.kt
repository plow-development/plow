package ru.plow.plow.plow

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("52762839-b079-463e-a740-63de1c38f424") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
