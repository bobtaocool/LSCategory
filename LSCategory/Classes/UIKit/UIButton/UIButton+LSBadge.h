//
//  UIButton+LSBadge.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LSBadge)

@property (strong, nonatomic) UILabel *ls_badge;
/// Badge 显示的值
@property (nonatomic) NSString *ls_badgeValue;
/// Badge 背景颜色
@property (nonatomic) UIColor *ls_badgeBGColor;
/// Badge 文字颜色
@property (nonatomic) UIColor *ls_badgeTextColor;
/// Badge 字体
@property (nonatomic) UIFont *ls_badgeFont;
/// 设置内边距
@property (nonatomic) CGFloat ls_badgePadding;
/// Badge 最小尺寸
@property (nonatomic) CGFloat ls_badgeMinSize;
/// Badge x坐标
@property (nonatomic) CGFloat ls_badgeOriginX;
/// Badge y坐标
@property (nonatomic) CGFloat ls_badgeOriginY;
// 当badge的大小为0时，隐藏badge
@property BOOL ls_shouldHideBadgeAtZero;
/// Badge 变化时，是否开启弹性动画
@property BOOL ls_shouldAnimateBadge;

/**
 更新角标的frame
 */
-(void)ls_updateBadgeFrame;

@end
