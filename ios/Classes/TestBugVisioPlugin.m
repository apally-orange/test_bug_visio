#import "TestBugVisioPlugin.h"
#if __has_include(<test_bug_visio/test_bug_visio-Swift.h>)
#import <test_bug_visio/test_bug_visio-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "test_bug_visio-Swift.h"
#endif

@implementation TestBugVisioPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTestBugVisioPlugin registerWithRegistrar:registrar];
}
@end
