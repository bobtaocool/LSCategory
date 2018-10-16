//
//  UIWebView+LSStyle.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/11.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIWebView+LSStyle.h"

@implementation UIWebView (LSStyle)

- (void)ls_shadowViewHidden:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:NO];
            for (UIView *shadowView in aView.subviews)
            {
                if ([shadowView isKindOfClass:[UIImageView class]])
                {
                    shadowView.hidden = hidden;  //上下滚动出边界时的黑色的图片 也就是拖拽后的上下阴影
                }
            }
        }
    }
}

- (void)ls_showsHorizontalScrollIndicator:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsHorizontalScrollIndicator:hidden];
        }
    }
}


- (void)ls_showsVerticalScrollIndicator:(BOOL)hidden{
    for (UIView *aView in [self subviews])
    {
        if ([aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)aView setShowsVerticalScrollIndicator:hidden];
        }
    }
}

-(void)ls_makeTransparent
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
}

-(void)ls_makeTransparentAndRemoveShadow
{
    [self ls_makeTransparent];
    [self ls_shadowViewHidden:YES];
}

@end
