//
//  NSURL+url.m
//  runtime理解
//
//  Created by mrlee on 2017/3/27.
//  Copyright © 2017年 mrlee. All rights reserved.
//

#import "NSURL+Url.h"
#import <objc/runtime.h>
@implementation NSURL (Url)
//+(instancetype)URLWithString:(NSString *)URLString{

//}
+(instancetype)YH_URLWithStr:(NSString *)str{
    NSURL *url = [NSURL YH_URLWithStr:str];
    if (url==nil) {
        NSLog(@"url为Nil");
    }
    return url;
}
+(void)load{
    //交换方法
    //method 成员方法
//    class_getClassMethod 获取类方法
//    class_getInstanceMethod 获取静态方法
    Method urlWithUrl = class_getClassMethod(self, @selector(URLWithString:));
    Method YH_URLWithStr = class_getClassMethod(self, @selector(YH_URLWithStr:));
    method_exchangeImplementations(urlWithUrl, YH_URLWithStr);
    
}
@end
