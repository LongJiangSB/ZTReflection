//
//  ViewController.m
//  ZTReflectionDemo
//
//  Created by Cer on 2018/12/19.
//  Copyright © 2018 Cer. All rights reserved.
//

#import "ViewController.h"
#import "ZTReflection.h"
#import "Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 输入参数
    void (^block)(void) = ^(){
        NSLog(@"p6");
    };
    
    NSString *string = @"HH";
    NSString * __strong *p1 = &string;
    NSString * __strong **p2 = &p1;
    
    YY yy = {8, 23.8f, 99999};
    NSValue *value = [NSValue valueWithBytes:&yy objCType:@encode(YY)];
    IMP imp = [self methodForSelector:NSSelectorFromString(@"tap")];
    NSLog(@"p1 = %p p2 = %p imp = %p", p1, p2, imp);
    
    // 不需要返回值时的调用（当然也可以调用下面的那个，返回值参数那里传NULL就是不获取返回值）
    Class class = NSClassFromString(@"Test");
    [ZTReflection performWithTarget:class selectorStringAndParameter:@"test:p1:p2:p3:p4:p5:p6:p7:p8:p9:p10:p11:p12:p13:p14:p15:", nil, @"p111", 222, 3.33f, CGSizeMake(1, 4), [NSNull null], block, YES, 'C', "C++", value, NSSelectorFromString(@"RTT"), p1, p2, [NSObject class], imp];
    
    // 带返回值，C字符串为空
    void *tempStr = NULL;
    [ZTReflection performWithTarget:class returnValue:&tempStr selectorStringAndParameter:@"test:p1:p2:p3:p4:p5:p6:p7:p8:p9:p10:p11:p12:p13:p14:p15:", @"带返回值的调用", @"p222", 222, 3.33f, CGSizeMake(5, 5), [NSNull null], nil, YES, 'Y', NULL, value, NSSelectorFromString(@"RTT"), p1, p2, [NSString class], imp];
    NSArray *array = (__bridge NSArray *)tempStr;
    NSLog(@"返回值 = %@", array);
    
    // 一个参数
    [ZTReflection performWithTarget:class selectorStringAndParameter:@"test:", 888];
    
    // 对象调用无参数方法
    [ZTReflection performWithTarget:[class new] returnValue:NULL selectorStringAndParameter:@"test"];
    
    return;
}

@end