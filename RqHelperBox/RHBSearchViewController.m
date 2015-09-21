//
//  RHBSearchViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-10-5.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBSearchViewController.h"
#import "RHBAPPSetting.h"
#import "RHBCommonUtil.h"
#import "RHBTableListViewController.h"

@interface RHBSearchViewController ()

@end

@implementation RHBSearchViewController
@synthesize searchBar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
    self.view.backgroundColor = [appset contentColor];
    [appset release];
    self.searchBar.delegate = self;
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    [self.searchBar becomeFirstResponder];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString* searchKey = self.searchBar.text;
    searchKey = [searchKey stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    int scopeIndex = [self.searchBar selectedScopeButtonIndex];
    
    NSArray* results = NULL;
    switch (scopeIndex) {
        case 0:
            results = [RHBCommonUtil searchProBy:searchKey];
            break;
        case 1:
            results = [RHBCommonUtil searchFunctionBy:searchKey];
            break;
        default:
            break;
    }
    
    RHBTableListViewController* tableList = [[RHBTableListViewController alloc] init];
    tableList.datapro = results;
    [self.navigationController pushViewController:tableList animated:YES];
    [tableList release];
}


@end
