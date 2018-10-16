//
//  NSObject+LSKVO.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/3.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSObject+LSKVO.h"
#import <objc/runtime.h>
@implementation NSObject (LSKVO)

-(void)ls_addObserver:(NSObject *)observer
           forKeyPath:(NSString *)keyPath
              options:(NSKeyValueObservingOptions)options
              context:(void *)context
            withBlock:(LSKVOBlock)block {
    
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), block, OBJC_ASSOCIATION_COPY);
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
}

-(void)ls_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath {
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), nil, OBJC_ASSOCIATION_COPY);
    [self removeObserver:observer forKeyPath:keyPath];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    LSKVOBlock block = objc_getAssociatedObject(self, (__bridge const void *)(keyPath));
    if (block) {
        block(change, context);
    }
}

-(void)ls_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(LSKVOBlock)block {
    
    [self ls_addObserver:self forKeyPath:keyPath options:options context:context withBlock:block];
}

-(void)ls_removeBlockObserverForKeyPath:(NSString *)keyPath {
    [self ls_removeBlockObserver:self forKeyPath:keyPath];
}

@end
