#include "VBPRootListController.h"

@implementation VBPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

+ (NSString *)hb_shareText {
	return [[NSBundle bundleForClass:self.class] localizedStringForKey:@"Check out #VolBanner by iFlames!" value:@"Check out #VolBanner by iFlames!" table:@"Root"];
}

+ (NSURL *)hb_shareURL {
	return [NSURL URLWithString:@"http://iflam.es"];
}

@end
