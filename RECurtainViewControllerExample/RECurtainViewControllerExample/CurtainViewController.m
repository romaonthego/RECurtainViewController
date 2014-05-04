//
//  CurtainViewController.m
//  RECurtainViewControllerExample
//
//  Created by Roman Efimov on 7/8/12.
//  Copyright (c) 2012 Roman Efimov. All rights reserved.
//

#import "CurtainViewController.h"
#import "DemoViewController.h"

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface CurtainViewController ()

@end

@implementation CurtainViewController

- (void)dismissHorizontalPressed
{
    DemoViewController *test = [[DemoViewController alloc] init];
    [self curtainRevealViewController:test transitionStyle:RECurtainTransitionHorizontal withCompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (void)dismissVerticalPressed
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    
    [self curtainRevealViewController:nav transitionStyle:RECurtainTransitionVertical withCompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ? [UIColor colorWithPatternImage:[UIImage imageNamed: IS_IPHONE_5 ? @"wallpaper-568h.jpg" : @"wallpaper.jpg"]] : [UIColor grayColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((self.view.frame.size.width - 200) / 2, self.view.frame.size.height / 2 - 30, 200, 44);
        [button setTitle:@"Dismiss Horizontal" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismissHorizontalPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((self.view.frame.size.width - 200) / 2, self.view.frame.size.height / 2 + 30, 200, 44);
        [button setTitle:@"Dismiss Vertical" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismissVerticalPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
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
