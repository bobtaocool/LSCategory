//
//  NSTimer+LSExtension.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//  定时器扩展

#import <Foundation/Foundation.h>

@interface NSTimer (LSExtension)
/** 暂停NSTimer*/
- (void)ls_pauseTimer;

/** 开始NSTimer*/
- (void)ls_resumeTimer;

/** 延迟开始NSTimer */
- (void)ls_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

/**
 创建一个定时器(默认runloop)，用block返回事件

 @param seconds 时间
 @param block 回调
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)ls_scheduledTimerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

/**
 创建一个定时器，用block返回事件 （需要自己手动加入runloop）

 @param seconds 时间
 @param block 回调
 @param repeats 是否重复
 @return NSTimer
 */
+ (NSTimer *)ls_timerWithTimeInterval:(NSTimeInterval)seconds block:(void (^)(NSTimer *timer))block repeats:(BOOL)repeats;

@end
