//
//  UIActionSheet+LSBlock.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/3.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIActionSheetLSCallBackBlock)(NSInteger buttonIndex);

@interface UIActionSheet (LSBlock)<UIActionSheetDelegate>

@property (nonatomic, copy) UIActionSheetLSCallBackBlock ls_actionSheetCallBackBlock;

/**
 通用样式

 @param actionSheetCallBackBlock 回调
 @param inView 父视图
 @param title 标题
 @param destitle 红色按钮
 @param cancelButtonName 取消按钮
 @param otherButtonTitles 其他那妞
 */
+ (void)ls_actionSheetWithCallBackBlock:(UIActionSheetLSCallBackBlock)actionSheetCallBackBlock
                           showInView:(UIView *)inView title:(NSString *)title destructiveButtonTitle:(NSString *)destitle  cancelButtonName:(NSString *)cancelButtonName
                otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
