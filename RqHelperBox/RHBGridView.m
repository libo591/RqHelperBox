//
//  RHBGridView.m
//  RqHelperBox
//
//  Created by 波 李 on 12-8-16.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBGridView.h"
#import "RHBAppDelegate.h"
#import "RHBAPPSetting.h"
#define COUNTPERPAGE 12
#define ROWCOUNT 3
#define COLCOUNT 3
#define IMAGEWIDTH 60
#define IMAGEHEIGHT 60
#define LABELWIDTH 60
#define LABELHEIGHT 20
#define OFFSETX 17.5
#define OFFSETY 8
#define PADDINGLEFT 17.5
#define PADDINGRIGHT 17.5
#define PADDINGTOP 8
#define PADDINGBOTTOM 8


@implementation RHBGridView
@synthesize items;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
        self.backgroundColor = [appset contentColor];
        [appset release];
    }
    return self;
}
- (void) showItems
{
    //#define CIRCLE_POINT_DISTANCE		16
    //uipagecontrol
    int itemcount = [items count];
    /*
    int pageNum = itemcount/COUNTPERPAGE;
    int yu = itemcount%COUNTPERPAGE;
    if(yu!=0){
        pageNum++;
    }
    UIPageControl* pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.bounds.size.width-CIRCLE_POINT_DISTANCE*pageNum)/2, 320, CIRCLE_POINT_DISTANCE*pageNum, 20)];
    pageControl.numberOfPages = pageNum;
    pageControl.backgroundColor = [[UIColor alloc] initWithWhite:0 alpha:1];
    [self addSubview:pageControl];
    [pageControl release];
    */
    //image and labels
    int colcount = COLCOUNT;
    for(int i=0;i<itemcount;i++){
        int rowindex = i/colcount;
        int colindex = i%colcount;
        CGFloat imageitemx = colindex*(IMAGEWIDTH+PADDINGLEFT+PADDINGRIGHT)+OFFSETX+PADDINGLEFT;
        CGFloat imageitemy = rowindex*(IMAGEHEIGHT+LABELHEIGHT+PADDINGTOP+PADDINGBOTTOM)+OFFSETY+PADDINGTOP;
        CGFloat labelitemx = imageitemx;
        CGFloat labelitemy = imageitemy+IMAGEHEIGHT;
        RHBGridViewItem* itemnow = [self.items objectAtIndex:i];
        //image
        UIImage* image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:itemnow.image ofType:@"png"]];
        UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(imageitemx, imageitemy, IMAGEWIDTH, IMAGEHEIGHT)];
        [button setImage:image forState:UIControlStateNormal];
        //[button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [image release];
        [button release];
        
        //label
        UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(labelitemx, labelitemy, LABELWIDTH, LABELHEIGHT)] autorelease];
        label.text = itemnow.title;
        label.font = [UIFont fontWithName:@"GeezaPro-Bold" size:12];
        label.textAlignment = UITextAlignmentCenter;
        label.backgroundColor = self.backgroundColor;
        [self addSubview:label];
    }
    
}
-(void) btnClick:(UIButton*)button
{
    RHBGridViewItem* item = [self.items objectAtIndex:[button tag]];
    UIViewController* viewControl = item.target;
    [((UIViewController*)[self.superview nextResponder]).navigationController pushViewController:viewControl animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
