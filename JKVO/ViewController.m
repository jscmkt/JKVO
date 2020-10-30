//
//  ViewController.m
//  JKVO
//
//  Created by 蒋士成 on 2020/10/29.
//  Copyright © 2020 jsc. All rights reserved.
//

#import "ViewController.h"

#import "LGPerson.h"
#import "NSObject+JKVO.h"
#import <objc/runtime.h>
@interface ViewController ()

@property (nonatomic, strong) LGPerson *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[LGPerson alloc] init];
    [self.person j_addObserver:self forKeyPath:@"nickName" block:^(id  _Nonnull observer, NSString * _Nonnull keyPath, id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"%@-%@",oldValue,newValue);
    }];
    
    [self.person j_addObserver:self forKeyPath:@"dack" block:^(id  _Nonnull observer, NSString * _Nonnull keyPath, id  _Nonnull oldValue, id  _Nonnull newValue) {
        NSLog(@"%@-%@",oldValue,newValue);
    }];
    self.person.nickName = @"KC";
    self.person.dack = @"jsc";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.person.nickName = [NSString stringWithFormat:@"%@+",self.person.nickName];
    self.person.dack = [NSString stringWithFormat:@"%@+",self.person.dack];
}

//#pragma mark - KVO回调
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    NSLog(@"%@",change);
//}

- (void)dealloc{
//    [self.person lg_removeObserver:self forKeyPath:@"nickName"];
}


#pragma mark - 遍历方法-ivar-property
- (void)printClassAllMethod:(Class)cls{
    unsigned int count = 0;
    Method *methodList = class_copyMethodList(cls, &count);
    for (int i = 0; i<count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        //IMP imp = class_getMethodImplementation(cls, sel);
        NSLog(@"%@",NSStringFromSelector(sel));
    }
    free(methodList);
}

#pragma mark - 遍历类以及子类
- (void)printClasses:(Class)cls{
    /// 注册类的总数
    int count = objc_getClassList(NULL, 0);
    /// 创建一个数组， 其中包含给定对象
    NSMutableArray *mArray = [NSMutableArray arrayWithObject:cls];
    /// 获取所有已注册的类
    Class* classes = (Class*)malloc(sizeof(Class)*count);
    objc_getClassList(classes, count);
    for (int i = 0; i<count; i++) {
        if (cls == class_getSuperclass(classes[i])) {
            [mArray addObject:classes[i]];
        }
    }
    free(classes);
    NSLog(@"classes = %@", mArray);
}

@end
