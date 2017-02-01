@interface NSObject ()
@property (assign,nonatomic) UIEdgeInsets clippingInsets;
@property (copy, nonatomic) NSString *message;
@property (copy, nonatomic) NSString *subtitle;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *sectionID;
@property (copy, nonatomic) id defaultAction;
+ (id)action;
+ (id)sharedInstance;
- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSInteger)arg3;
- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSInteger)arg3 playLightsAndSirens:(BOOL)arg4 withReply:(id)arg5;
- (void)_replaceIntervalElapsed;
- (void)_dismissIntervalElapsed;
- (BOOL)containsAttachments;
- (void)setSecondaryText:(id)arg1 italicized:(BOOL)arg2;
- (int)_ui_resolvedTextAlignment;

- (UILabel *)tb_titleLabel;
- (void)tb_setTitleLabel:(UILabel *)label;
- (void)tb_setSecondaryLabel:(UILabel *)label;

@end

@interface UIStatusBarItemView : UIView
@end

@interface UIStatusBarTimeItemView : UIStatusBarItemView{
    NSString *_timeString;
}

-(int)textStyle;
-(BOOL)cachesImage;
-(id)contentsImage;
-(BOOL)updateForNewData:(id)arg1 actions:(int)arg2;
@end

@interface SBBannerController : NSObject
+ (id)sharedInstance;
- (void)_presentBannerView:(id)view;
@end

@interface SBAlertItemsController
-(void)displayBanner;
@end

@interface BBBulletin : NSObject
@property (copy) id bulletinID;
@end

@interface BBBulletinRequest : BBBulletin
@end

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (float)volume;
- (void)setVolume:(float)volume;
- (BOOL)isRingerMuted;
@end

@interface SBLockScreenManager : NSObject
-(BOOL)isUILocked;
@end

@interface VolumeControl : NSObject
+ (id)sharedVolumeControl;
- (void)setMediaVolume:(float)volume;
- (float)volume;
- (float)getMediaVolume;
@end

@interface SBBannerContainerViewController : UIViewController
@property(readonly, assign, nonatomic) UIView* bannerContextView;
-(CGRect)_bannerFrameForOrientation:(int)orientation;
-(CGRect)_bannerFrame;
-(id)_bulletin;
@end
