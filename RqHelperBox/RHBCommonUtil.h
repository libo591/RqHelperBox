//
//  RHBCommonUtil.h
//  RqHelperBox
//
//  Created by 波 李 on 12-8-19.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHBCommonUtil : NSObject
+(NSString *)ToHex:(int)tmpid;
+(NSString*) imageNameOfType:(NSString*)typeName;
+(NSString*) labelOfType:(NSString*)typeName;
+(NSDictionary*) parserProduct;
+(NSDictionary*) parserFunctions;
+(NSArray*) searchProBy:(NSString*)key;
+(NSArray*) searchFunctionBy:(NSString*)key;
@end
