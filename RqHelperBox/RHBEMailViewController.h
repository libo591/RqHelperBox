//
//  RHBEMailViewController.h
//  RqHelperBox
//
//  Created by 波 李 on 12-9-26.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MFMailComposeViewController.h"
#import "YouMiWallDelegateProtocol.h"

@interface RHBEMailViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate,YouMiWallDelegate>

@property(copy)NSString* fileContent;
@end
