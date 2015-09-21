//
//  RHBSearchViewController.h
//  RqHelperBox
//
//  Created by 波 李 on 12-10-5.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHBSearchViewController : UIViewController<UISearchBarDelegate>
{
    IBOutlet UISearchBar* searchBar;
}
@property(nonatomic,retain) UISearchBar* searchBar;
@end
