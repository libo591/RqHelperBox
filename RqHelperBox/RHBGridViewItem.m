//
//  RHBGridViewItem.m
//  RqHelperBox
//
//  Created by 波 李 on 12-8-13.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBGridViewItem.h"

@implementation RHBGridViewItem
@synthesize title;
@synthesize image;
@synthesize target;

-(void)dealloc
{
    [title release];
    [image release];
    [target release];
    [super dealloc];
}
@end
