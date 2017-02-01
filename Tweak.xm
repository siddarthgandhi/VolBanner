#import "VolBanner.h"

UISlider *slider;

%hook SBBannerContainerViewController
%new
-(void)sliderAction:(UISlider *)slider {
    [[%c(VolumeControl) sharedVolumeControl] setMediaVolume:slider.value];
}

-(void)loadView {
    %orig;
    if ([[[self _bulletin] bulletinID] isEqualToString:@"com.iflames.volbanner.volumebanner"]) {
    	CGRect frame = CGRectMake(0.0, 40.0, self._bannerFrame.size.width-10.0, 7.0);
    	slider = [[UISlider alloc] initWithFrame:frame];
    	[slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    	[slider setBackgroundColor:[UIColor clearColor]];
    	slider.minimumValue = 0.0;
    	slider.maximumValue = 1.0;
    	slider.continuous = YES;
    	slider.value = [[%c(VolumeControl) sharedVolumeControl] volume];
    	slider.center = CGPointMake(CGRectGetMidX(self._bannerFrame), CGRectGetMidY(self._bannerFrame));
    	[self.bannerContextView addSubview:slider];
    	self.bannerContextView.userInteractionEnabled = YES;
	}
}

- (void)dealloc {
	slider = nil;
	%orig;
}
%end

%hook VolumeControl

id request = [[[%c(BBBulletinRequest) alloc] init] autorelease];

- (void)increaseVolume {

    if ([[%c(SBLockScreenManager) sharedInstance] isUILocked]) {
      %orig;
    } else {
      [request setBulletinID:@"com.iflames.volbanner.volumebanner"];
      [request setDefaultAction: [%c(BBAction) action]];

      id ctrl = [%c(SBBulletinBannerController) sharedInstance];
      if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:)]) {
          [ctrl observer:nil addBulletin:request forFeed:2];
      } else if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
          [ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
      }

      %orig;
    }
}

- (void)decreaseVolume {

    if ([[%c(SBLockScreenManager) sharedInstance] isUILocked]) {
      %orig;
    } else {
      [request setBulletinID:@"com.iflames.volbanner.volumebanner"];
      [request setDefaultAction: [%c(BBAction) action]];

      id ctrl = [%c(SBBulletinBannerController) sharedInstance];
      if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:)]) {
          [ctrl observer:nil addBulletin:request forFeed:2];
      } else if ([ctrl respondsToSelector:@selector(observer:addBulletin:forFeed:playLightsAndSirens:withReply:)]) {
          [ctrl observer:nil addBulletin:request forFeed:2 playLightsAndSirens:YES withReply:nil];
      }

      %orig;
    }
}

- (void)_changeVolumeBy:(float)by {
	%orig;
	if (slider)
    	slider.value = slider.value + by;
}

- (BOOL)_HUDIsDisplayableForCategory:(NSString *)category {
	if ([category isEqualToString:@"Ringtone"] || [category isEqualToString:@"Audio/Video"] || [category isEqualToString:@"Headphones"])
		return NO;
	return %orig;
}

%end
