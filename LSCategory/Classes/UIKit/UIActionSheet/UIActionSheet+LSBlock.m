//
//  UIActionSheet+LSBlock.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/3.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIActionSheet+LSBlock.h"
#import <objc/runtime.h>

static NSString *UIActionSheetKey = @"UIActionSheetKey";

@implementation UIActionSheet (LSBlock)

+ (void)ls_actionSheetWithCallBackBlock:(UIActionSheetLSCallBackBlock)actionSheetCallBackBlock
                                 showInView:(UIView *)inView
                                  title:(NSString *)title
                 destructiveButtonTitle:(NSString *)destitle
                       cancelButtonName:(NSString *)cancelButtonName
                      otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION
{
    UIActionSheet * sheet =[[UIActionSheet alloc]initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonName destructiveButtonTitle:destitle otherButtonTitles:otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [sheet addButtonWithTitle:other];
        }
        va_end(args);
    }
    sheet.delegate = sheet;
    [sheet showInView:inView];
    sheet.ls_actionSheetCallBackBlock = actionSheetCallBackBlock;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.ls_actionSheetCallBackBlock) {
        self.ls_actionSheetCallBackBlock(buttonIndex);
    }
}

- (void)setLs_actionSheetCallBackBlock:(UIActionSheetLSCallBackBlock)ls_actionSheetCallBackBlock {
    
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIActionSheetKey, ls_actionSheetCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

- (UIActionSheetLSCallBackBlock)ls_actionSheetCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIActionSheetKey);
}

@end
