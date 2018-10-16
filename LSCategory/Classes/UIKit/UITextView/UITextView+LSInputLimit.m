//
//  UITextView+LSInputLimit.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UITextView+LSInputLimit.h"
#import <objc/runtime.h>
static const void *lsTextViewInputLimitMaxLength = &lsTextViewInputLimitMaxLength;

@implementation UITextView (LSInputLimit)

- (NSInteger)ls_maxLength {
    return [objc_getAssociatedObject(self, lsTextViewInputLimitMaxLength) integerValue];
}
- (void)setLs_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, lsTextViewInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ls_textViewTextDidChange:)
                                                name:@"UITextViewTextDidChangeNotification" object:self];
    
}
- (void)ls_textViewTextDidChange:(NSNotification *)notification {
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
+ (void)load {
    [super load];
    Method origMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method newMethod = class_getInstanceMethod([self class], @selector(ls_textView_limit_swizzledDealloc));
    method_exchangeImplementations(origMethod, newMethod);
}
- (void)ls_textView_limit_swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self ls_textView_limit_swizzledDealloc];
}

@end
