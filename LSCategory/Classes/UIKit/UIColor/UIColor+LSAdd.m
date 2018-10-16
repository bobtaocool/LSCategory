//
//  UIColor+LSAdd.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIColor+LSAdd.h"

CGFloat ls_colorComponentFrom(NSString *string, NSUInteger start, NSUInteger length) {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}
@implementation UIColor (LSAdd)

+ (UIColor *)ls_colorWithHex:(UInt32)hex
{
    return [UIColor ls_colorWithHex:hex andAlpha:1];
}

+ (UIColor *)ls_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((hex >> 16) & 0xFF)/255.0
                           green:((hex >> 8) & 0xFF)/255.0
                            blue:(hex & 0xFF)/255.0
                           alpha:alpha];
}

+ (UIColor *)ls_colorWithHexString:(NSString *)hexString
{
    CGFloat alpha, red, blue, green;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = ls_colorComponentFrom(colorString, 0, 1);
            green = ls_colorComponentFrom(colorString, 1, 1);
            blue  = ls_colorComponentFrom(colorString, 2, 1);
            break;
            
        case 4: // #ARGB
            alpha = ls_colorComponentFrom(colorString, 0, 1);
            red   = ls_colorComponentFrom(colorString, 1, 1);
            green = ls_colorComponentFrom(colorString, 2, 1);
            blue  = ls_colorComponentFrom(colorString, 3, 1);
            break;
            
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = ls_colorComponentFrom(colorString, 0, 2);
            green = ls_colorComponentFrom(colorString, 2, 2);
            blue  = ls_colorComponentFrom(colorString, 4, 2);
            break;
            
        case 8: // #AARRGGBB
            alpha = ls_colorComponentFrom(colorString, 0, 2);
            red   = ls_colorComponentFrom(colorString, 2, 2);
            green = ls_colorComponentFrom(colorString, 4, 2);
            blue  = ls_colorComponentFrom(colorString, 6, 2);
            break;
            
        default:
            return nil;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f
                           green:green/255.f
                            blue:blue/255.f
                           alpha:alpha];
}

+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
{
    return [self ls_colorWithWholeRed:red
                                green:green
                                 blue:blue
                                alpha:1.0];
}

+ (UIColor *)ls_randomColor
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end
