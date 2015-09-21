//
//  RHBAPPSetting.m
//  RqHelperBox
//
//  Created by 波 李 on 12-8-17.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBAPPSetting.h"
#import "JSONKit.h"

@implementation RHBAPPSetting

-(UIColor*) contentColor
{
    return [self settingsColor:@"dc"];
}

-(UIColor*) navColor
{
    return [self settingsColor:@"navc"];
}

-(UIColor*) tabColor
{
    return [self settingsColor:@"tabc"];
}
-(UIColor*) settingsColor:(NSString*)tag
{
    NSBundle* mb = [NSBundle mainBundle];
    NSString* path = [mb pathForResource:@"settings" ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    id ss = [content objectFromJSONString];
    int count = [ss count];
    UIColor* color=[UIColor whiteColor];
    for(int i=0;i<count;i++){
        NSDictionary* dic = [ss objectAtIndex:i];
        NSString* key = [dic objectForKey:@"key"];
        if([key isEqualToString:tag]){
            NSString* value = [dic objectForKey:@"value"];
            NSArray* tabcar = [value componentsSeparatedByString:@","];
            CGFloat red = [[tabcar objectAtIndex:0] intValue]/255.0;
            CGFloat green = [[tabcar objectAtIndex:1] intValue]/255.0;
            CGFloat blue = [[tabcar objectAtIndex:2] intValue]/255.0;
            color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
            break;
        }
    }
    return color;
}

@end
