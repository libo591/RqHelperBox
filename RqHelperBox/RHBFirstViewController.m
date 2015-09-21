//
//  RHBFirstViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-7-15.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBFirstViewController.h"
#import "RHBTableListViewController.h"
#import "RHBGridView.h"
#import "RHBGridViewItem.h"
#import "RHBCommonUtil.h"
#import "RHBSearchViewController.h"

@interface RHBFirstViewController ()

@end

@implementation RHBFirstViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"知识库", @"有关产品问答");
        self.tabBarItem.image = [UIImage imageNamed:@"tabzhishi"];
        self.navigationItem.title = @"知识库";
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
}
							
- (void)viewDidLoad
{
    NSDictionary* configDic = [RHBCommonUtil parserProduct];
    
    NSArray* keys = [configDic allKeys];
    keys = [keys sortedArrayUsingComparator:^(id obj1,id obj2){
        return [[obj2 description] compare:[obj1 description]];
    }];
    int count  = [keys count];
    NSMutableArray* griditems=[[[NSMutableArray alloc] initWithCapacity:count] autorelease];
    [super viewDidLoad];
    int i;
    for(i=0;i<count;i++){
        RHBGridViewItem* item1 = [[RHBGridViewItem alloc] init];
        item1.title = [keys objectAtIndex:i];
        item1.image = [RHBCommonUtil imageNameOfType:item1.title];
        RHBTableListViewController* titlev = [[[RHBTableListViewController alloc] init] autorelease];
        titlev.datapro = [configDic objectForKey:item1.title];
        titlev.title = item1.title;
        titlev.navigationItem.title = item1.title;
        item1.target = titlev;
        [griditems addObject:item1];
        [item1 release];
    }
    
    RHBGridViewItem* searchItem = [[RHBGridViewItem alloc] init];
    searchItem.title = @"随意搜";
    searchItem.image = @"search";
    
    RHBSearchViewController* search = [[RHBSearchViewController alloc] initWithNibName:@"RHBSearchViewController" bundle:nil];
    search.navigationItem.title = @"随意搜";
    
    
    searchItem.target = search;
    [griditems addObject:searchItem];
    [searchItem release];
    [search release];
    
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
