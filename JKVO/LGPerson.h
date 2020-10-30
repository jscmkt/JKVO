//
//  LGPerson.h
//  005---KVO自动销毁机制
//
//  Created by cooci on 2019/1/5.
//  Copyright © 2019 cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPerson : NSObject{
    @public
    NSString *name;
}
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *dack;
@end

NS_ASSUME_NONNULL_END
