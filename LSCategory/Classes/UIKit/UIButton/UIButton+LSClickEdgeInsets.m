//
//  UIButton+LSClickEdgeInsets.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/5.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIButton+LSClickEdgeInsets.h"
#import <objc/runtime.h>
@implementation UIButton (LSClickEdgeInsets)

- (UIEdgeInsets)ls_touchAreaInsets
{
    return [objc_getAssociatedObject(self, @selector(ls_touchAreaInsets)) UIEdgeInsetsValue];
}

- (void)setLs_touchAreaInsets:(UIEdgeInsets)touchAreaInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(ls_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.ls_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}


@end
