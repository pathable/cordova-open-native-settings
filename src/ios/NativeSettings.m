#import "NativeSettings.h"

@implementation NativeSettings

- (BOOL)do_open:(NSString *)pref {
	if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:pref]]) {
		return YES;
	} else {
		return NO;
	}
}

- (void)open:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* key = [command.arguments objectAtIndex:0];
	BOOL result = NO;

	
    if ([key isEqualToString:@"application_details"]) {
        result = [self do_open:UIApplicationOpenSettingsURLString];
    }
	else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid Action"];
	}
		
	if (result) {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Opened"];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Cannot open"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
