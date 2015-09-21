//
//  RHBCommonDetailViewController.h
//  RqHelperBox
//
//  Created by 波 李 on 12-10-1.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHBEMailViewController.h"
@interface RHBCommonDetailViewController : RHBEMailViewController
@property(copy) NSString* detailContent;
@property(assign) Boolean bannerIsVisible;
@property(retain) UIWebView* webView;
@end
