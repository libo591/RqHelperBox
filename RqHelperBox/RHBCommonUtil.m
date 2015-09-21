//
//  RHBCommonUtil.m
//  RqHelperBox
//
//  Created by 波 李 on 12-8-19.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBCommonUtil.h"
#import "JSONKit.h"

@implementation RHBCommonUtil
+(NSString *)ToHex:(int)tmpid
{
    NSString *endtmp=@"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig=tmpid%16;
    int tmp=tmpid/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[[[NSString alloc]initWithFormat:@"%i",ttmpig] autorelease];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[[[NSString alloc]initWithFormat:@"%i",tmp] autorelease];
            
    }
    endtmp=[[[NSString alloc]initWithFormat:@"%@%@",nStrat,nLetterValue] autorelease];
    //补0
    /*
    NSString *str=@"";
    if([endtmp length]<4)
    {
        for (int x=[endtmp length]; x<4; x++) {
            str=[str stringByAppendingString:@"0"];
        }
        endtmp=[[NSString alloc]initWithFormat:@"%@%@",str,endtmp];
    }
     */
    return endtmp;
}

+(NSString*) imageNameOfType:(NSString*)typeName
{
    if([typeName isEqualToString:@"随笔杂谈"]){
        return @"sbzt44";
    }else if([typeName isEqualToString:@"设计基础"]){
        return @"sjjc44";
    }else if([typeName isEqualToString:@"填报专题"]){
        return @"tbzt44";
    }else if([typeName isEqualToString:@"打印专题"]){
        return @"dyzt44";
    }else if([typeName isEqualToString:@"安装部署"]){
        return @"azbs44";
    }else if([typeName isEqualToString:@"性能优化"]){
        return @"xnyh44";
    }else if([typeName isEqualToString:@"编程接口"]){
        return @"bcjk44";
    }else if([typeName isEqualToString:@"数据集函数"]){
        return @"funcdataset60";
    }else if([typeName isEqualToString:@"单元格函数"]){
        return @"funccell60";
    }else if([typeName isEqualToString:@"时间日期函数"]){
        return @"funcdate60";
    }else if([typeName isEqualToString:@"数学函数"]){
        return @"funcmath60";
    }else if([typeName isEqualToString:@"字符串函数"]){
        return @"funcstring60";
    }else if([typeName isEqualToString:@"数据类型转换"]){
        return @"functypechange60";
    }else if([typeName isEqualToString:@"数据类型判断"]){
        return @"functypejudge60";
    }else if([typeName isEqualToString:@"分页后运算函数"]){
        return @"funcpage60";
    }else if([typeName isEqualToString:@"统计图运算函数"]){
        return @"funcgraph60";
    }else if([typeName isEqualToString:@"API专题"]){
        return @"apitableimg";
    }
    return @"";
}

+(NSString*) labelOfType:(NSString*)typeName
{
    if([typeName isEqualToString:@"随笔杂谈"]){
        return @"随笔杂谈";
    }else if([typeName isEqualToString:@"设计基础"]){
        return @"设计基础";
    }else if([typeName isEqualToString:@"填报专题"]){
        return @"填报专题";
    }else if([typeName isEqualToString:@"打印专题"]){
        return @"打印专题";
    }else if([typeName isEqualToString:@"安装部署"]){
        return @"安装部署";
    }else if([typeName isEqualToString:@"性能优化"]){
        return @"性能优化";
    }else if([typeName isEqualToString:@"编程接口"]){
        return @"编程接口";
    }else if([typeName isEqualToString:@"数据集函数"]){
        return @"数据集";
    }else if([typeName isEqualToString:@"单元格函数"]){
        return @"单元格";
    }else if([typeName isEqualToString:@"时间日期函数"]){
        return @"时间日期";
    }else if([typeName isEqualToString:@"数学函数"]){
        return @"数学";
    }else if([typeName isEqualToString:@"字符串函数"]){
        return @"字符串";
    }else if([typeName isEqualToString:@"数据类型转换"]){
        return @"类型转换";
    }else if([typeName isEqualToString:@"数据类型判断"]){
        return @"类型判断";
    }else if([typeName isEqualToString:@"分页后运算函数"]){
        return @"分页相关";
    }else if([typeName isEqualToString:@"统计图运算函数"]){
        return @"统计图";
    }else if([typeName isEqualToString:@"API专题"]){
        return @"API专题";
    }
    return @"";
}

+(NSDictionary*) parserProduct
{
    NSString* filepath = [[NSBundle mainBundle] pathForResource:@"config_g" ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary* configDic = [content objectFromJSONString];
    return configDic;
}
+(NSDictionary*) parserFunctions
{
    NSString* filepath = [[NSBundle mainBundle] pathForResource:@"functions_g" ofType:@"json"];
    NSString* content = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    NSDictionary* configDic = [content objectFromJSONString];
    return configDic;
}

+(NSArray*) searchProBy:(NSString*)key
{
    NSDictionary* dic = [RHBCommonUtil parserProduct];
    NSEnumerator* keyenum = [dic keyEnumerator];
    NSMutableArray* results = [[[NSMutableArray alloc] init] autorelease];
    id obj;
    while(obj=[keyenum nextObject]){
        NSArray* currValue = [dic objectForKey:obj];
        int count = [currValue count];
        for(int i=0;i<count;i++){
            NSDictionary* currObj = [currValue objectAtIndex:i];
            NSString* title = [currObj objectForKey:@"title"];
            NSRange rangeTitle = [title rangeOfString:key];
            if(rangeTitle.location!=NSNotFound){
                [results addObject:currObj];
                continue;
            }
            
            NSString* filename = [currObj objectForKey:@"content"];
            NSArray* components = [filename componentsSeparatedByString:@"."];
            NSString* name = [components objectAtIndex:0];
            NSString* suffixname = [components objectAtIndex:1];
            NSString* content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:suffixname] encoding:NSUTF8StringEncoding error:nil]; 
            
            NSRange rangeContent = [content rangeOfString:key];
            if(rangeContent.location!=NSNotFound){
                [results addObject:currObj];
                continue;
            }
        }
    }
    return results;
}
+(NSArray*) searchFunctionBy:(NSString*)key
{
    NSDictionary* dic = [RHBCommonUtil parserFunctions];
    NSEnumerator* keyenum = [dic keyEnumerator];
    NSMutableArray* results = [[[NSMutableArray alloc] init] autorelease];
    id obj;
    while(obj=[keyenum nextObject]){
        NSArray* currValue = [dic objectForKey:obj];
        int count = [currValue count];
        for(int i=0;i<count;i++){
            NSDictionary* currObj = [currValue objectAtIndex:i];
            NSString* title = [currObj objectForKey:@"title"];
            NSRange rangeTitle = [title rangeOfString:key];
            if(rangeTitle.location!=NSNotFound){
                [results addObject:currObj];
                continue;
            }
            
            NSString* content = [currObj objectForKey:@"content"];
            NSRange rangeContent = [content rangeOfString:key];
            if(rangeContent.location!=NSNotFound){
                [results addObject:currObj];
                continue;
            }
        }
    }
    return results;
}
@end
