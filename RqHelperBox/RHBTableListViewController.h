//
//  RHBTableListViewController.h
//  RqHelperBox
//
//  Created by 波 李 on 12-10-1.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHBTableListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain) NSArray* datapro;
@end
