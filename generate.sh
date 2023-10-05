flutter pub run pigeon \
  --input pigeons/book.dart \
  --dart_out lib/pigeon.dart \
  --objc_header_out ios/Runner/pigeon.h \
  --objc_source_out ios/Runner/pigeon.m \
  --java_out ./android/app/src/main/java/io/flutter/plugins/Pigeon.java \
  --java_package "io.flutter.plugins"


#flutter pub run pigeon \
#  --input pigeons/brightness_messages.dart \
#  --dart_out lib/brightness_pigeon.dart \
#  --objc_header_out ios/Runner/BrightnessPigeon.h \
#  --objc_source_out ios/Runner/BrightnessPigeon.m \
#  --java_out ./android/app/src/main/java/io/flutter/plugins/BrightnessPigeon.java \
#  --java_package "io.flutter.plugins"