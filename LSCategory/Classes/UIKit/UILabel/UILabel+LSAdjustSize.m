//
//  UILabel+LSAdjustSize.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UILabel+LSAdjustSize.h"

@implementation UILabel (LSAdjustSize)

- (void)ls_setAdjustsFontSizeToFitWidthByMinimumScale:(CGFloat)scale
{
    self.adjustsFontSizeToFitWidth = YES;
    self.minimumScaleFactor = scale;
}
    
@end
