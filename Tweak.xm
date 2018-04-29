#import <UIKit/UIKit.h>
#import "libcolorpicker.h"

@interface SBWallpaperEffectView : UIView
@end

@interface SBDockView : UIView
@property(retain, nonatomic) SBWallpaperEffectView *_backgroundView;
@end

// For respring
@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(BOOL)arg1;
@end

// Func to respring
void respring() {
  [[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}

// Func to get bool from prefbundle
inline bool checkEnabled(NSString *key) {
  return [[[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/com.rudi.dockcolourprefs.plist"] valueForKey:key] boolValue];
}

// Func to get the desired color from the pref bundle
NSString *getColor() {
  return [[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/com.rudi.dockcolourprefs.plist"] objectForKey:@"usercolor"];
  // NSString *colorHex = [[NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/com.rudi.dockcolourprefs.plist"] objectForKey:@"usercolor"];
  // UIColor *userColor = LCPParseColorString(colorHex, @"#ff0000");
  // return userColor;
}

%hook SBDockView

-(void)setBackgroundAlpha:(double)arg1 {

  // Runs original method
	%orig;

  // Checks if the tweak is enabled
  if(checkEnabled(@"enabled")) {

    // Hides the blur so colour is visible
  	MSHookIvar<SBWallpaperEffectView *>(self, "_backgroundView").alpha = 0.0f;

    NSString *colorHex = getColor();

    self.backgroundColor = LCPParseColorString(colorHex, @"#ff0000");

  }
}

%end


%ctor {

  // Resprings when prefbundle send noti
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)respring, CFSTR("com.rudi.nodock/respring"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
