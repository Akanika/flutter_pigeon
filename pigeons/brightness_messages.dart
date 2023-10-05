import 'package:pigeon/pigeon.dart';

@FlutterApi()
abstract class FlutterBrightnessApi {
  BrightnessMessage getDefaultDeviceBrightness();

  @async
  BrightnessMessage getPreferredDeviceBrightness();

  void onDeviceBrightnessChanged(BrightnessMessage brightness);
}

class BrightnessConstraintsMessage {
  int? maxBrightness;
  int? minBrightness;
}

class BrightnessMessage {
  int? brightnessValue;
}