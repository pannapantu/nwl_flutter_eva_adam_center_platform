// This file should only be used on Flutter Web.
import 'package:flutter/foundation.dart' show kIsWeb;

void registerPlatformView(String viewType, dynamic factory) {
  if (kIsWeb) {
    // This is a placeholder for future web-specific registration
    print("Web: Registering platform view: $viewType");
  }
}
