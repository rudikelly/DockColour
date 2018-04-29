#include "XXXRootListController.h"
#import "libcolorpicker.h"

@implementation XXXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void)donate {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/rudikelly"]];
}

- (void)respring {

	// Sends notification to SBDockView where respring method works
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.rudi.nodock/respring"), NULL, NULL, YES);
}

// Loads colorpicker i think lol
- (void)viewWillAppear:(BOOL)animated
{
	[self reload];
	[super viewWillAppear:animated];
}
@end
