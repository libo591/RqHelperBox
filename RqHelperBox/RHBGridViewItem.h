//
//  RHBGridViewItem.h
//  RqHelperBox
//
//  Created by 波 李 on 12-8-13.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RHBGridViewItem : NSObject
@property(copy)NSString* title;
@property(copy)NSString* image;
@property(retain)UIViewController* target;
@end
