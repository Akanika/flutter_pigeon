// Autogenerated from Pigeon (v9.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package io.flutter.plugins;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class BrightnessPigeon {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class BrightnessMessage {
    private @Nullable Long brightnessValue;

    public @Nullable Long getBrightnessValue() {
      return brightnessValue;
    }

    public void setBrightnessValue(@Nullable Long setterArg) {
      this.brightnessValue = setterArg;
    }

    public static final class Builder {

      private @Nullable Long brightnessValue;

      public @NonNull Builder setBrightnessValue(@Nullable Long setterArg) {
        this.brightnessValue = setterArg;
        return this;
      }

      public @NonNull BrightnessMessage build() {
        BrightnessMessage pigeonReturn = new BrightnessMessage();
        pigeonReturn.setBrightnessValue(brightnessValue);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(1);
      toListResult.add(brightnessValue);
      return toListResult;
    }

    static @NonNull BrightnessMessage fromList(@NonNull ArrayList<Object> list) {
      BrightnessMessage pigeonResult = new BrightnessMessage();
      Object brightnessValue = list.get(0);
      pigeonResult.setBrightnessValue((brightnessValue == null) ? null : ((brightnessValue instanceof Integer) ? (Integer) brightnessValue : (Long) brightnessValue));
      return pigeonResult;
    }
  }

  private static class FlutterBrightnessApiCodec extends StandardMessageCodec {
    public static final FlutterBrightnessApiCodec INSTANCE = new FlutterBrightnessApiCodec();

    private FlutterBrightnessApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return BrightnessMessage.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof BrightnessMessage) {
        stream.write(128);
        writeValue(stream, ((BrightnessMessage) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated class from Pigeon that represents Flutter messages that can be called from Java. */
  public static class FlutterBrightnessApi {
    private final @NonNull BinaryMessenger binaryMessenger;

    public FlutterBrightnessApi(@NonNull BinaryMessenger argBinaryMessenger) {
      this.binaryMessenger = argBinaryMessenger;
    }

    /** Public interface for sending reply. */ 
    @SuppressWarnings("UnknownNullness")
    public interface Reply<T> {
      void reply(T reply);
    }
    /** The codec used by FlutterBrightnessApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return FlutterBrightnessApiCodec.INSTANCE;
    }
    public void getDefaultDeviceBrightness(@NonNull Reply<BrightnessMessage> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.FlutterBrightnessApi.getDefaultDeviceBrightness", getCodec());
      channel.send(
          null,
          channelReply -> {
            @SuppressWarnings("ConstantConditions")
            BrightnessMessage output = (BrightnessMessage) channelReply;
            callback.reply(output);
          });
    }
    public void getPreferredDeviceBrightness(@NonNull Reply<BrightnessMessage> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.FlutterBrightnessApi.getPreferredDeviceBrightness", getCodec());
      channel.send(
          null,
          channelReply -> {
            @SuppressWarnings("ConstantConditions")
            BrightnessMessage output = (BrightnessMessage) channelReply;
            callback.reply(output);
          });
    }
    public void onDeviceBrightnessChanged(@NonNull BrightnessMessage brightnessArg, @NonNull Reply<Void> callback) {
      BasicMessageChannel<Object> channel =
          new BasicMessageChannel<>(
              binaryMessenger, "dev.flutter.pigeon.FlutterBrightnessApi.onDeviceBrightnessChanged", getCodec());
      channel.send(
          new ArrayList<Object>(Collections.singletonList(brightnessArg)),
          channelReply -> callback.reply(null));
    }
  }
}
