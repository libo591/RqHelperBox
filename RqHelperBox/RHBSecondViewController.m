//
//  RHBSecondViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-7-15.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBSecondViewController.h"
#import "RHBGridView.h"
#import "RHBGridViewItem.h"
#import "RHBCommonUtil.h"
#import "RHBTableListViewController.h"

@interface RHBSecondViewController ()

@end

@implementation RHBSecondViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"表达式", @"润乾表达式的列表和常用表达式，如隔行异色等");
        self.tabBarItem.image = [UIImage imageNamed:@"tabexp"];
        self.navigationItem.title = @"润乾表达式";
    }
    return self;
}
							
- (void)viewDidLoad
{
    NSDictionary* configDic = [RHBCommonUtil parserFunctions];
    NSArray* keys = [configDic allKeys];
    keys = [keys sortedArrayUsingComparator:^(id obj1,id obj2){
        return [[obj2 description] compare:[obj1 description]];
    }];
    int count  = [keys count];
    
    NSMutableArray* griditems=[[[NSMutableArray alloc] initWithCapacity:count] autorelease];
    [super viewDidLoad];
    int i;
    for(i=0;i<count;i++){
        NSString* type = [keys objectAtIndex:i];
        if([type isEqualToString:@""]){
            continue;
        }
        RHBGridViewItem* item1 = [[RHBGridViewItem alloc] init];
        item1.title = [RHBCommonUtil labelOfType:type];
        item1.image = [RHBCommonUtil imageNameOfType:type];
        RHBTableListViewController* titlev = [[[RHBTableListViewController alloc] init] autorelease];
        titlev.title = type;
        titlev.navigationItem.title = type;
        titlev.datapro = [configDic objectForKey:type];
        item1.target = titlev;
        [griditems addObject:item1];
        [item1 release];
    }
    CGFloat w = [[UIScreen mainScreen] bounds].size.width;
    CGFloat h = [[UIScreen mainScreen] bounds].size.height-20-44-49;
    RHBGridView* gridView = [[RHBGridView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    gridView.items = griditems;
    [gridView showItems];
    [self.view addSubview:gridView];
    [gridView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
