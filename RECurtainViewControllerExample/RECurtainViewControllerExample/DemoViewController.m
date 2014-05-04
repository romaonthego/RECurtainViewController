//
//  DemoViewController.m
//  RECurtainViewControllerExample
//
//  Created by Roman Efimov on 7/8/12.
//  Copyright (c) 2012 Roman Efimov. All rights reserved.
//

#import "DemoViewController.h"
#import "CurtainViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)buttonPressed
{
    CurtainViewController *test = [[CurtainViewController alloc] init];
    
    [self curtainRevealViewController:test transitionStyle:RECurtainTransitionHorizontal withCompletionHandler:^{
        NSLog(@"Done");
    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((self.view.frame.size.width - 200) / 2, self.view.frame.size.height / 2 - 20, 200, 44);
        [button setTitle:@"Test button" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
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
