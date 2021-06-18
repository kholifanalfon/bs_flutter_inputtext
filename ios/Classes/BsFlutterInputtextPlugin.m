#import "BsFlutterInputtextPlugin.h"
#if __has_include(<bs_flutter_inputtext/bs_flutter_inputtext-Swift.h>)
#import <bs_flutter_inputtext/bs_flutter_inputtext-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bs_flutter_inputtext-Swift.h"
#endif

@implementation BsFlutterInputtextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBsFlutterInputtextPlugin registerWithRegistrar:registrar];
}
@end
