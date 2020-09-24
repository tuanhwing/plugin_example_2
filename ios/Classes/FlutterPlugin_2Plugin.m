#import "FlutterPlugin_2Plugin.h"
#if __has_include(<flutter_plugin_2/flutter_plugin_2-Swift.h>)
#import <flutter_plugin_2/flutter_plugin_2-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_plugin_2-Swift.h"
#endif

@implementation FlutterPlugin_2Plugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPlugin_2Plugin registerWithRegistrar:registrar];
}
@end
