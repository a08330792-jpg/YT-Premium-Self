#import <UIKit/UIKit.h>

@interface YTCellController : NSObject
- (id)model;
@end

@interface YTCompositeResponseViewController : UIViewController
@end

%hook YTCellController
- (id)initWithCollectionCtrl:(id)arg1 cellNode:(id)arg2 {
    id original = %orig;
    if (original && [original respondsToSelector:@selector(model)]) {
        id cellModel = [original model];
        if (cellModel) {
            NSString *className = NSStringFromClass([cellModel class]);
			 if ([className containsString:@"Ad"] || [className containsString:@"Promoted"]) {
                return nil;
            }
        }
    }
    return original;
}
%end

%hook YTCompositeResponseViewController
- (void)viewWillAppear:(BOOL)animated {
    NSString *viewName = NSStringFromClass([self class]);
    if ([viewName containsString:@"Ad"] || [viewName containsString:@"Preroll"]) {
		[self dismissViewControllerAnimated:NO completion:nil];
        return;
    }
    %orig;
}
%end

@interface YTHotConfig : NSObject
@end

%hook YTHotConfig
- (BOOL)isPremiumEnhancedBitrateEnabled {
	 return YES;
	 }
- (BOOL)enableEnhancedBitrateForResolution:(int)currentResolution {
    return YES;
}
- (BOOL)isSfrVideoQualityEnabled {
    return YES;
}
%end
