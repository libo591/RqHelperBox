//
//  RHBCommonDetailViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-10-1.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBCommonDetailViewController.h"
#import "RHBAPPSetting.h"
#import "RHBCommonUtil.h"

@interface RHBCommonDetailViewController ()

@end

@implementation RHBCommonDetailViewController
@synthesize detailContent;
@synthesize bannerIsVisible;
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIImage* sendEmailIcon = [UIImage imageNamed:@"mailsend.png"];
        UIImageView* imageView = [[UIImageView alloc] initWithImage:sendEmailIcon];
        imageView.frame = CGRectMake(0, 0, 30, 27);
        
        imageView.userInteractionEnabled = YES; 
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editBtnClick:)]; 
        [imageView addGestureRecognizer:singleTap];
        [singleTap release];
        
        UIBarButtonItem* buttonItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];
        [imageView release];
        
        UIImage* apppushIcon = [UIImage imageNamed:@"apppush.png"];
        UIImageView* appimageView = [[UIImageView alloc] initWithImage:apppushIcon];
        appimageView.frame = CGRectMake(0, 0, 30, 27);
         
        appimageView.userInteractionEnabled = YES; 
        UITapGestureRecognizer *appsingleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(youmiBtnClick:)]; 
        [appimageView addGestureRecognizer:appsingleTap];
        [appsingleTap release];
         
        UIBarButtonItem* appbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:appimageView];
        [appimageView release];
        
        NSArray* btnArr = [[NSArray alloc] initWithObjects:buttonItem,appbuttonItem, nil];
        self.navigationItem.rightBarButtonItems = btnArr;
        [buttonItem release];
        [appbuttonItem release];
        [btnArr release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel* navTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    navTitleLabel.text = self.navigationItem.title;
    navTitleLabel.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:12];
    navTitleLabel.numberOfLines = 0;
    navTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    navTitleLabel.textAlignment = UITextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    navTitleLabel.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = navTitleLabel;
    //[navTitleLabel sizeToFit];
    [navTitleLabel release];
    
    RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
    self.view.backgroundColor = [appset contentColor];
    [appset release];
    
	CGFloat uiheight = [[UIScreen mainScreen] bounds].size.height;
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, uiheight-20-44-49);
    
    
    //uiwebview
    webView = [[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] autorelease];;
    webView.backgroundColor = self.view.backgroundColor;
    webView.scalesPageToFit = YES;
    webView.userInteractionEnabled = YES;
    [webView loadHTMLString:self.detailContent baseURL:nil];
    self.fileContent = self.detailContent;
    [self.view addSubview:webView];
    
    /*
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dbtap:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    [doubleTap release];
     */
}
/*
-(void) dbtap:(id*) sender
{
    NSLog(@"%d",webView.scalesPageToFit);
    webView.scalesPageToFit = !webView.scalesPageToFit;
    NSLog(@"%d",webView.scalesPageToFit);
    [webView reload];
}
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.detailContent = NULL;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
