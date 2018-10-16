//
//  NSObject+LSKVO.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/3.
//  Copyright © 2018年 杨荣. All rights reserved.
//  类添加观察者或者作为观察者

#import <Foundation/Foundation.h>
typedef void (^LSKVOBlock)(NSDictionary *change, void *context);
@interface NSObject (LSKVO)

/**
 添加观察者与监听属性
 
 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block  监听回调
 */
- (void)ls_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(LSKVOBlock)block;
/**
 移除观察者对属性的监听
 
 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 */
-(void)ls_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

/**
 对象本身作为观察者
 
 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block 监听回调
 */
-(void)ls_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(LSKVOBlock)block;

/**
 移除观察者对属性的监听
 
 @param keyPath 监听的属性
 */
-(void)ls_removeBlockObserverForKeyPath:(NSString *)keyPath;

@end
