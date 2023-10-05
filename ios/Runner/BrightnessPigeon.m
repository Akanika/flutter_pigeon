// Autogenerated from Pigeon (v9.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "BrightnessPigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface BrightnessMessage ()
+ (BrightnessMessage *)fromList:(NSArray *)list;
+ (nullable BrightnessMessage *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation BrightnessMessage
+ (instancetype)makeWithBrightnessValue:(nullable NSNumber *)brightnessValue {
  BrightnessMessage* pigeonResult = [[BrightnessMessage alloc] init];
  pigeonResult.brightnessValue = brightnessValue;
  return pigeonResult;
}
+ (BrightnessMessage *)fromList:(NSArray *)list {
  BrightnessMessage *pigeonResult = [[BrightnessMessage alloc] init];
  pigeonResult.brightnessValue = GetNullableObjectAtIndex(list, 0);
  return pigeonResult;
}
+ (nullable BrightnessMessage *)nullableFromList:(NSArray *)list {
  return (list) ? [BrightnessMessage fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    (self.brightnessValue ?: [NSNull null]),
  ];
}
@end

@interface FlutterBrightnessApiCodecReader : FlutterStandardReader
@end
@implementation FlutterBrightnessApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [BrightnessMessage fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FlutterBrightnessApiCodecWriter : FlutterStandardWriter
@end
@implementation FlutterBrightnessApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[BrightnessMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FlutterBrightnessApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FlutterBrightnessApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FlutterBrightnessApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FlutterBrightnessApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FlutterBrightnessApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FlutterBrightnessApiCodecReaderWriter *readerWriter = [[FlutterBrightnessApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

@interface FlutterBrightnessApi ()
@property(nonatomic, strong) NSObject<FlutterBinaryMessenger> *binaryMessenger;
@end

@implementation FlutterBrightnessApi

- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger> *)binaryMessenger {
  self = [super init];
  if (self) {
    _binaryMessenger = binaryMessenger;
  }
  return self;
}
- (void)getDefaultDeviceBrightnessWithCompletion:(void (^)(BrightnessMessage *_Nullable, FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.FlutterBrightnessApi.getDefaultDeviceBrightness"
      binaryMessenger:self.binaryMessenger
      codec:FlutterBrightnessApiGetCodec()];
  [channel sendMessage:nil reply:^(id reply) {
    BrightnessMessage *output = reply;
    completion(output, nil);
  }];
}
- (void)getPreferredDeviceBrightnessWithCompletion:(void (^)(BrightnessMessage *_Nullable, FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.FlutterBrightnessApi.getPreferredDeviceBrightness"
      binaryMessenger:self.binaryMessenger
      codec:FlutterBrightnessApiGetCodec()];
  [channel sendMessage:nil reply:^(id reply) {
    BrightnessMessage *output = reply;
    completion(output, nil);
  }];
}
- (void)onDeviceBrightnessChangedBrightness:(BrightnessMessage *)arg_brightness completion:(void (^)(FlutterError *_Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.FlutterBrightnessApi.onDeviceBrightnessChanged"
      binaryMessenger:self.binaryMessenger
      codec:FlutterBrightnessApiGetCodec()];
  [channel sendMessage:@[arg_brightness ?: [NSNull null]] reply:^(id reply) {
    completion(nil);
  }];
}
@end
