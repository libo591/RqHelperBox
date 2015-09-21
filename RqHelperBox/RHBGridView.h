//
//  RHBGridView.h
//  RqHelperBox
//
//  Created by 波 李 on 12-8-16.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHBGridViewItem.h"

@interface RHBGridView : UIView
@property(retain)NSArray* items;
- (void) showItems;
@end
