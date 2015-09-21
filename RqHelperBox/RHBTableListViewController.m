//
//  RHBTableListViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-10-1.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBTableListViewController.h"
#import "RHBAPPSetting.h"
#import "RHBCommonUtil.h"
#import "RHBCommonDetailViewController.h"

@interface RHBTableListViewController ()

@end

@implementation RHBTableListViewController
@synthesize datapro;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
    self.view.backgroundColor = [appset contentColor];
    [appset release];
    
    CGFloat uiheight = [[UIScreen mainScreen] bounds].size.height;
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, uiheight-20-44-49);
    
    UITableView* proTableView;
	proTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    proTableView.dataSource = self;
    proTableView.delegate = self;
    proTableView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:proTableView];
    [proTableView release];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datapro count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellIdenty = [@"titleCell" stringByAppendingString:[NSString stringWithFormat:@"%d",[indexPath row]]];
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdenty];
    if(cell==NULL){
        NSInteger currRow = [indexPath row];
        NSDictionary* vonow = [self.datapro objectAtIndex:currRow];
        cell= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenty] autorelease];
        //image
        NSString* imageName = [RHBCommonUtil imageNameOfType:self.navigationItem.title];
        UIImage* image = [[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]] autorelease];
        UIImageView* imageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
        imageView.image = image;
        [cell.contentView addSubview:imageView];
        //time
        CGRect timeRect = CGRectMake(7, 60, 50, 20);
        UILabel* timelabel = [[[UILabel alloc] initWithFrame:timeRect] autorelease];
        timelabel.text = [vonow objectForKey:@"date"];
        timelabel.textColor = [[[UIColor alloc] initWithRed:0 green:0.6 blue:1 alpha:1] autorelease];
        timelabel.textAlignment = UITextAlignmentCenter;
        timelabel.backgroundColor = self.view.backgroundColor;
        timelabel.font = [UIFont fontWithName:@"CourierNewPS-BoldItalicMT" size:8];
        [cell.contentView addSubview:timelabel];
        
        CGFloat nowwidth = self.view.frame.size.width;
        //title
        UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(68, 0, nowwidth-73.0, 35)] autorelease];
        label.text = [vonow objectForKey:@"title"];
        label.numberOfLines = 0;
        label.lineBreakMode = UILineBreakModeWordWrap;
        label.backgroundColor = self.view.backgroundColor;
        label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:14];
        [cell.contentView addSubview:label];
        
        //desc
        CGRect descRect = CGRectMake(68, 35, nowwidth-73.0, 45);
        UILabel* labeldesc = [[[UILabel alloc] initWithFrame:descRect] autorelease];
        labeldesc.text = [vonow objectForKey:@"desc"];
        labeldesc.numberOfLines = 0;
        labeldesc.lineBreakMode = UILineBreakModeWordWrap;
        labeldesc.backgroundColor = self.view.backgroundColor;
        labeldesc.font = [UIFont fontWithName:@"CourierNewPS-ItalicMT" size:10];
        [cell.contentView addSubview:labeldesc];
        
    }
    return cell;
}
//==============tableView delegete======================================
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger currRow = [indexPath row];
    NSDictionary* vonow = [self.datapro objectAtIndex:currRow];
    NSString* contentFile = [vonow objectForKey:@"content"];
    RHBCommonDetailViewController* controller = [[RHBCommonDetailViewController alloc] init];
    controller.navigationItem.title = [vonow objectForKey:@"title"];
    
    NSString* content = NULL;

    if([contentFile hasSuffix:@".html"]){
        NSArray* arr = [contentFile componentsSeparatedByString:@"."];
        NSString* contentFileName = [arr objectAtIndex:0];
        NSString* path = [[NSBundle mainBundle] pathForResource:contentFileName ofType:@"html"];
        content = [[[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil] autorelease];
        RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
        CGColorRef colorRef = [[appset contentColor] CGColor];
        [appset release];
        const CGFloat* arrcolor = CGColorGetComponents(colorRef);
        //title
        NSRange bodyRange = [content rangeOfString:@"<body>"];
        NSString* bodyred = [RHBCommonUtil ToHex:arrcolor[0]*255];
        NSString* bodygreen = [RHBCommonUtil ToHex:arrcolor[1]*255];
        NSString* bodyblue = [RHBCommonUtil ToHex:arrcolor[2]*255];
        NSString* newstr = [[[[[[@"<body style='background-color:#" stringByAppendingString:bodyred] stringByAppendingString:bodygreen] stringByAppendingString:bodyblue] stringByAppendingString:@";'><h4 style='text-align:center;'>"]  stringByAppendingString:[vonow objectForKey:@"title"]] stringByAppendingString:@"</h4>"];
        content = [content stringByReplacingCharactersInRange:bodyRange withString:newstr];
    }
    else if([contentFile hasSuffix:@".rqapi"]){
        RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
        CGColorRef colorRef = [[appset contentColor] CGColor];
        [appset release];
        const CGFloat* arrcolor = CGColorGetComponents(colorRef);
        NSString* bodyred = [RHBCommonUtil ToHex:arrcolor[0]*255];
        NSString* bodygreen = [RHBCommonUtil ToHex:arrcolor[1]*255];
        NSString* bodyblue = [RHBCommonUtil ToHex:arrcolor[2]*255];
        NSArray* arr1 = [contentFile componentsSeparatedByString:@"."];
        NSString* contentFileName = [arr1 objectAtIndex:0];
        NSString* apitext = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:contentFileName ofType:@"rqapi"] encoding:NSUTF8StringEncoding error:nil];
        content = [[[[[@"<html><head></head><body style='font-size:12px;background-color:#"  stringByAppendingString:bodyred] stringByAppendingString:bodygreen] stringByAppendingString:bodyblue] stringByAppendingString:@"'><div style='white-space:pre;"] stringByAppendingString:@"'><ol>"];
        NSArray* arr = [apitext componentsSeparatedByString:@"\n"];
        int count = [arr count];
        for(int i=0;i<count;i++){
            NSString* curr = [arr objectAtIndex:i];
            content = [[[content stringByAppendingString:@"<li><span>"] stringByAppendingString:curr] stringByAppendingString:@"</span></li>"];
        }
        content = [content stringByAppendingString:@"</ol><div></body></html>"];
    }
    else{
        content = contentFile;
    }
    
    controller.detailContent = content;
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
