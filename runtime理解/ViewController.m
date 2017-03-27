//
//  ViewController.m
//  runtime理解
//
//  Created by mrlee on 2017/3/27.
//  Copyright © 2017年 mrlee. All rights reserved.
//可以交换方法实心

#import "ViewController.h"
#import "objc/message.h"
#import "objc/runtime.h"
#import "NSURL+Url.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//方法调用
-(void)methodCall{
    //这里 我们可以不引用 Person Cllass
    NSObject* p = objc_msgSend(objc_msgSend(objc_getRequiredClass("Person"), @selector(alloc)), @selector(init));
    objc_msgSend(p, @selector(eat));
}
//方法交换
-(void)exchangeMthod{
    //尝试修改系统方法
    NSURL * url = [NSURL URLWithString:@"中文"];
    NSLog(@"%@",url);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
