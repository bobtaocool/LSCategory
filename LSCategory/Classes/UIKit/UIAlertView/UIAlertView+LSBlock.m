//
//  UIAlertView+LSBlock.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/29.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIAlertView+LSBlock.h"
#import <objc/runtime.h>

static NSString *UIAlertViewKey = @"UIAlertViewKey";
@implementation UIAlertView (LSBlock)

+ (void)ls_alertWithCallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles: otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);
    }
    alert.delegate = alert;
    [alert show];
    alert.ls_alertViewCallBackBlock = alertViewCallBackBlock;
}

+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName actionButtonName:(NSString *)actionButtonName CallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock
{
    [self ls_alertWithCallBackBlock:alertViewCallBackBlock title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:actionButtonName, nil];
}

+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName
{
     [self ls_alertWithCallBackBlock:nil title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:nil];
}

+ (void)ls_alertWithTitle:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName CallBackBlock:(UIAlertViewLSCallBackBlock)alertViewCallBackBlock
{
    [self ls_alertWithCallBackBlock:alertViewCallBackBlock title:title message:message cancelButtonName:cancelButtonName otherButtonTitles:nil];
}

- (void)setLs_alertViewCallBackBlock:(UIAlertViewLSCallBackBlock)ls_alertViewCallBackBlock {
    
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIAlertViewKey, ls_alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

- (UIAlertViewLSCallBackBlock)ls_alertViewCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.ls_alertViewCallBackBlock) {
        self.ls_alertViewCallBackBlock(buttonIndex);
    }
}

@end
