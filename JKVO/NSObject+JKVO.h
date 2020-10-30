//
//  NSObject+JKVO.h
//  JKVO
//
//  Created by 蒋士成 on 2020/10/29.
//  Copyright © 2020 jsc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^JKVOBlock)(id observer,NSString *,id oldVlaue,id newValue);

@interface NSObject (JKVO)
-(void)j_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath block:(JKVOBlock)block;
-(void)j_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END
