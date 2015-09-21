//
//  RHBEMailViewController.m
//  RqHelperBox
//
//  Created by 波 李 on 12-9-26.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBEMailViewController.h"
#import "YouMiWall.h"

@interface RHBEMailViewController ()

@end

@implementation RHBEMailViewController
@synthesize fileContent;
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
    fileContent = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqual:@"好，知道了"]){
        NSLog(@"1111");
    }else{
        NSLog(@"配置邮件");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    //关闭邮件发送窗口
    [self dismissModalViewControllerAnimated:YES];
    UIAlertView* alertView=NULL;
    switch (result) {  
        case MFMailComposeResultCancelled:  
            //msg = @"用户取消编辑邮件";  
            break;  
        case MFMailComposeResultSaved:  
            //msg = @"用户成功保存邮件";  
            break;  
        case MFMailComposeResultSent:  
            //msg = @"用户点击发送，将邮件放到队列中，还没发送";  已经将邮件放入到发送队列中
            alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"邮件已经放入发送队列" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            break;  
        case MFMailComposeResultFailed:  
            //msg = @"用户试图保存或者发送邮件失败";  
            break;  
        default:  
            //msg = @"";
            break;  
    }  
}
-(void) youmiBtnClick:(id)sender
{
    NSString* appid = @"4afec0f142481469";
    NSString* apppwd = @"34f5babcda0e305e";
	YouMiWall* youmiwall = [[YouMiWall alloc] initWithAppID:appid withAppSecret:apppwd];
    youmiwall.delegate = self;
    [youmiwall requestOffers:NO];
}
-(void) editBtnClick:(id)sender
{
    if(![MFMailComposeViewController canSendMail]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机未配置邮件参数" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        return;
    }
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;  
    //设置主题  
    [mailPicker setSubject: self.navigationController.title];  
    //添加收件人
    NSArray *toRecipients = [NSArray arrayWithObject: @""];
    [mailPicker setToRecipients: toRecipients];  
    /*
     //添加抄送
     NSArray *ccRecipients = [NSArray arrayWithObjects:@"bcd@163.com", @"cde@163.com", nil];  
     [mailPicker setCcRecipients:ccRecipients];      
     //添加密送
     NSArray *bccRecipients = [NSArray arrayWithObjects:@"def@163.com", nil];  
     [mailPicker setBccRecipients:bccRecipients];  
     */
    // 添加一张图片  
    /*
     UIImage *addPic = [UIImage imageNamed: @"Icon@2x.png"];  
     NSData *imageData = UIImagePNGRepresentation(addPic);            // png     
     [mailPicker addAttachmentData: imageData mimeType: @"" fileName: @"Icon.png"];  
     */
    //添加一个pdf附件
    /*
     NSString *file = [self fullBundlePathFromRelativePath:@"xxx.pdf"];
     NSData *pdf = [NSData dataWithContentsOfFile:file];
     [mailPicker addAttachmentData: pdf mimeType: @"" fileName: @"xxx.pdf"];  
     */
    NSString *emailBody = self.fileContent;  
    [mailPicker setMessageBody:emailBody isHTML:YES];  
    [self presentModalViewController: mailPicker animated:YES];  
    [mailPicker release];  
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

//youmi
-(void) didReceiveOffers:(YouMiWall *)adWall
{
    NSLog(@"receive success");
    [adWall showOffers];
}
-(void) didFailToReceiveOffers:(YouMiWall *)adWall error:(NSError *)error
{
    NSLog(@"failed");
}

-(void) didShowWallView:(YouMiWall *)adWall
{
    NSLog(@"show");
}

-(void) didDismissWallView:(YouMiWall *)adWall
{
    NSLog(@"dismiss");
}
@end
