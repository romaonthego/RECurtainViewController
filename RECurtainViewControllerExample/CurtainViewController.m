//
//  CurtainViewController.m
//  RECurtainViewControllerExample
//
//  Created by Roman Efimov on 7/8/12.
//  Copyright (c) 2012 Roman Efimov. All rights reserved.
//

#import "CurtainViewController.h"
#import "DemoViewController.h"

@interface CurtainViewController ()

@end

@implementation CurtainViewController

- (void)dismissHorizontalPressed
{
    DemoViewController *test = [[DemoViewController alloc] init];
    [self curtainRevealViewController:test 
                      transitionStyle:RECurtainTransitionHorizontal
                      backgroundColor:[UIColor blackColor]];
}

- (void)dismissVerticalPressed
{
    DemoViewController *test = [[DemoViewController alloc] init];
    [self curtainRevealViewController:test 
                      transitionStyle:RECurtainTransitionVertical 
                      backgroundColor:[UIColor blackColor]];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaper.jpg"]];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(60, 170, 200, 44);
        [button setTitle:@"Dismiss Horizontal" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismissHorizontalPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(60, 220, 200, 44);
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
