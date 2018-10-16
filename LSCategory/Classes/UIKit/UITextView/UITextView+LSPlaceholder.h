//
//  UITextView+LSPlaceholder.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//  设置UITextView预置文字

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (LSPlaceholder)

@property (nonatomic, readonly) UITextView *placeholderTextView;

@property (nonatomic, strong) IBInspectable NSString *placeholder;//设置预置文字
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;//设置预置文字富文本
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;//设置预置文字颜色

+ (UIColor *)defaultPlaceholderColor;//默认预置文字颜色

@end
