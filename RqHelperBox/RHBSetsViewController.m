//
//  RHBSetsViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-7-15.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBSetsViewController.h"

@interface RHBSetsViewController ()

@end

@implementation RHBSetsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"设置", @"问答可以选择是否从服务器更新。任务可以设置优先级颜色");
        self.tabBarItem.image = [UIImage imageNamed:@"tabset.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
