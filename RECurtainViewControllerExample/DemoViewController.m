//
//  DemoViewController.m
//  RECurtainViewControllerExample
//
//  Created by Roman Efimov on 7/8/12.
//  Copyright (c) 2012 Roman Efimov. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)buttonPressed
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hi" message:@"Test" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(60, 100, 200, 44);
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
