//
//  UIView+LSAddLine.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIView+LSAddLine.h"

@implementation UIView (LSAddLine)

- (void)ls_drawLineStartPoint:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint color:(UIColor *)color andLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer * line = [UIView drawLine:startPoint to:endPoint color:color andLineWidth:lineWidth];
    [self.layer addSublayer:line];
}

- (void)ls_addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types
{
    for (int i = 0 ; i < types.count; i ++) {
        [self ls_addBorderLayerWithColor:color size:size borderType:[types[i] integerValue]];
    }
}

- (void)ls_addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(LSBorderType)boderType
{
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
    switch (boderType) {
        case LSBorderTypeTop:
            layer.frame = CGRectMake(0, 0, self.frame.size.width, size);
            break;
        case LSBorderTypeLeft:
            layer.frame = CGRectMake(0, 0, size, self.frame.size.height);
            break;
        case LSBorderTypeBottom:
            layer.frame = CGRectMake(0, self.frame.size.height - size, self.frame.size.width, size);
            break;
        case LSBorderTypeRight:
            layer.frame = CGRectMake(self.frame.size.width - size, 0, size, self.frame.size.height);
            break;
        default:
            break;
    }
}

-(void)ls_addBoarderWithColor:(UIColor *)color andLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer * boardLine = [UIView drawRect:self.frame radius:0 color:color andLineWidth:lineWidth];
    [self.layer addSublayer:boardLine];
}
//画线
+ (CAShapeLayer *)drawLine:(CGPoint)points to:(CGPoint)pointe color:(UIColor *)color andLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:points];
    [path addLineToPoint:pointe];
    [path closePath];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [color CGColor];
    shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
    shapeLayer.lineWidth = lineWidth;
    return shapeLayer;
}

//画框框线
+ (CAShapeLayer *)drawRect:(CGRect)rect radius:(CGFloat)redius color:(UIColor *)color andLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *solidLine = [CAShapeLayer layer];
    UIBezierPath *solidPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:redius];
    solidLine.lineWidth = lineWidth;
    solidLine.strokeColor = color.CGColor;
    solidLine.fillColor = [UIColor clearColor].CGColor;
    solidLine.path = solidPath.CGPath;
    return solidLine;
}

-(void)ls_setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
    CGRect rect = self.bounds;
    
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

@end
