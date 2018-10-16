//
//  UIAlertView+LSBlock.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/29.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewLSCallBackBlock)(NSInteger buttonIndex);

@interface UIAlertView (LSBlock)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewLSCallBackBlock ls_alertViewCallBackBlock;

/**
 通用样式
 @param alertViewCallBackBlock 回调
 @param title 标题
 @param message 内容
 @param cancelButtonName 取消按钮
 @param otherButtonTitles 其他按钮
 */
+ (void)ls_alertWithCallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock
                            title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

/**
 左右样式
 @param title 标题
 @param message 内容
 @param cancelButtonName 取消按钮
 @param actionButtonName 动作按钮
 @param alertViewCallBackBlock 回调
 */
+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName actionButtonName:(NSString *)actionButtonName CallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock;

/**
 唯一样式无回调事件
 @param title 标题
 @param message 内容
 @param cancelButtonName 按钮名称
 */
+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName;


/**
 唯一样式有回调事件
 @param title 标题
 @param message 内容
 @param cancelButtonName 按钮名称
 @param alertViewCallBackBlock 回调
 */
+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName CallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock;

@end
