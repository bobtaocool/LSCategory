//
//  UITextField+LSInputLimit.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UITextField+LSInputLimit.h"
#import <objc/runtime.h>

static const void *lsTextFieldInputLimitMaxLength = &lsTextFieldInputLimitMaxLength;
@implementation UITextField (LSInputLimit)

- (NSInteger)ls_maxLength {
    return [objc_getAssociatedObject(self, lsTextFieldInputLimitMaxLength) integerValue];
}
- (void)setLs_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, lsTextFieldInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self action:@selector(ls_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}
- (void)ls_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.ls_maxLength > 0 && toBeString.length > self.ls_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.ls_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.ls_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.ls_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.ls_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}

@end
