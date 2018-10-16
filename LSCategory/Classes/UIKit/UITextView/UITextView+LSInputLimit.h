//
//  UITextView+LSInputLimit.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LSInputLimit)

/**
 输入现在的最大长度，如果ls_maxLength<=0，不受限制
 */
@property (assign, nonatomic)  NSInteger ls_maxLength;

@end
