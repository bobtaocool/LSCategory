//
//  UIButton+LSBadge.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIButton+LSBadge.h"
#import <objc/runtime.h>

NSString const *ls_UIButton_badgeKey = @"ls_UIButton_badgeKey";

NSString const *ls_UIButton_badgeBGColorKey = @"ls_UIButton_badgeBGColorKey";
NSString const *ls_UIButton_badgeTextColorKey = @"ls_UIButton_badgeTextColorKey";
NSString const *ls_UIButton_badgeFontKey = @"ls_UIButton_badgeFontKey";
NSString const *ls_UIButton_badgePaddingKey = @"ls_UIButton_badgePaddingKey";
NSString const *ls_UIButton_badgeMinSizeKey = @"ls_UIButton_badgeMinSizeKey";
NSString const *ls_UIButton_badgeOriginXKey = @"ls_UIButton_badgeOriginXKey";
NSString const *ls_UIButton_badgeOriginYKey = @"ls_UIButton_badgeOriginYKey";
NSString const *ls_UIButton_shouldHideBadgeAtZeroKey = @"ls_UIButton_shouldHideBadgeAtZeroKey";
NSString const *ls_UIButton_shouldAnimateBadgeKey = @"ls_UIButton_shouldAnimateBadgeKey";
NSString const *ls_UIButton_badgeValueKey = @"ls_UIButton_badgeValueKey";

@implementation UIButton (LSBadge)

@dynamic ls_badgeValue, ls_badgeBGColor, ls_badgeTextColor, ls_badgeFont;
@dynamic ls_badgePadding, ls_badgeMinSize, ls_badgeOriginX, ls_badgeOriginY;
@dynamic ls_shouldHideBadgeAtZero, ls_shouldAnimateBadge;

- (void)ls_badgeInit
{
    // Default design initialization
    self.ls_badgeBGColor   = [UIColor redColor];
    self.ls_badgeTextColor = [UIColor whiteColor];
    self.ls_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.ls_badgePadding   = 6;
    self.ls_badgeMinSize   = 8;
    self.ls_badgeOriginX   = self.frame.size.width - self.ls_badge.frame.size.width/2;
    self.ls_badgeOriginY   = -4;
    self.ls_shouldHideBadgeAtZero = YES;
    self.ls_shouldAnimateBadge = YES;
    // Avoids badge to be clipped when animating its scale
    self.clipsToBounds = NO;
}

#pragma mark - Utility methods

// Handle badge display when its properties have been changed (color, font, ...)
- (void)ls_refreshBadge
{
    // Change new attributes
    self.ls_badge.textColor        = self.ls_badgeTextColor;
    self.ls_badge.backgroundColor  = self.ls_badgeBGColor;
    self.ls_badge.font             = self.ls_badgeFont;
}

- (CGSize) ls_badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self ls_duplicateLabel:self.ls_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)ls_updateBadgeFrame
{
    
    CGSize expectedLabelSize = [self ls_badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.ls_badgeMinSize) ? self.ls_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.ls_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.ls_badge.frame = CGRectMake(self.ls_badgeOriginX, self.ls_badgeOriginY, minWidth + padding, minHeight + padding);
    self.ls_badge.layer.cornerRadius = (minHeight + padding) / 2;
    self.ls_badge.layer.masksToBounds = YES;
}


- (void)ls_updateBadgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.ls_shouldAnimateBadge && ![self.ls_badge.text isEqualToString:self.ls_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.ls_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.ls_badge.text = self.ls_badgeValue;
    
    // Animate the size modification if needed
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self ls_updateBadgeFrame];
    }];
}

- (UILabel *)ls_duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)ls_removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.ls_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.ls_badge removeFromSuperview];
        self.ls_badge = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel*)ls_badge {
    return objc_getAssociatedObject(self, &ls_UIButton_badgeKey);
}
-(void)setLs_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &ls_UIButton_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSString *)ls_badgeValue {
    return objc_getAssociatedObject(self, &ls_UIButton_badgeValueKey);
}
-(void) setLs_badgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &ls_UIButton_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    if (!badgeValue || [badgeValue isEqualToString:@""] || ([badgeValue isEqualToString:@"0"] && self.ls_shouldHideBadgeAtZero)) {
        [self ls_removeBadge];
    } else if (!self.ls_badge) {
        // Create a new badge because not existing
        self.ls_badge                      = [[UILabel alloc] initWithFrame:CGRectMake(self.ls_badgeOriginX, self.ls_badgeOriginY, 20, 20)];
        self.ls_badge.textColor            = self.ls_badgeTextColor;
        self.ls_badge.backgroundColor      = self.ls_badgeBGColor;
        self.ls_badge.font                 = self.ls_badgeFont;
        self.ls_badge.textAlignment        = NSTextAlignmentCenter;
        [self ls_badgeInit];
        [self addSubview:self.ls_badge];
        [self ls_updateBadgeValueAnimated:NO];
    } else {
        [self ls_updateBadgeValueAnimated:YES];
    }
}


-(UIColor *)ls_badgeBGColor {
    return objc_getAssociatedObject(self, &ls_UIButton_badgeBGColorKey);
}
-(void)setLs_badgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &ls_UIButton_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_refreshBadge];
    }
}


-(UIColor *)ls_badgeTextColor {
    return objc_getAssociatedObject(self, &ls_UIButton_badgeTextColorKey);
}
-(void)setLs_badgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &ls_UIButton_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_refreshBadge];
    }
}


-(UIFont *)ls_badgeFont {
    return objc_getAssociatedObject(self, &ls_UIButton_badgeFontKey);
}
-(void)setLs_badgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &ls_UIButton_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_refreshBadge];
    }
}


-(CGFloat) ls_badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_badgePaddingKey);
    return number.floatValue;
}
-(void) setLs_badgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &ls_UIButton_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_updateBadgeFrame];
    }
}


-(CGFloat) ls_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_badgeMinSizeKey);
    return number.floatValue;
}
-(void) setLs_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &ls_UIButton_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_updateBadgeFrame];
    }
}


-(CGFloat) ls_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_badgeOriginXKey);
    return number.floatValue;
}
-(void) setLs_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &ls_UIButton_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_updateBadgeFrame];
    }
}

-(CGFloat) ls_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_badgeOriginYKey);
    return number.floatValue;
}
-(void) setLs_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &ls_UIButton_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.ls_badge) {
        [self ls_updateBadgeFrame];
    }
}


-(BOOL) ls_shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setLs_shouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &ls_UIButton_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(BOOL) ls_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &ls_UIButton_shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setLs_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &ls_UIButton_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
