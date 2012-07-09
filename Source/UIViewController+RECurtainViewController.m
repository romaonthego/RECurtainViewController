//
// UIViewController+RECurtainViewController.m
//
// Copyright (c) 2012 Roman Efimov (http://github.com/romaonthego)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIViewController+RECurtainViewController.h"
#import "AppDelegate.h"

@implementation UIViewController (RECurtainViewController)

- (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)curtainRevealViewController:(UIViewController *)viewControllerToReveal transitionStyle:(RECurtainTransitionStyle)transitionStyle
{
    UIImage *selfPortrait = [self imageWithView:self.view];
    UIImage *controllerScreenshot = [self imageWithView:viewControllerToReveal.view];
    
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    coverView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:coverView];
    
    int offset = 0;
    if (controllerScreenshot.size.height == [UIScreen mainScreen].bounds.size.height) {
        offset = -20;
    }
    
    UIImageView *fadedView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30 + offset, controllerScreenshot.size.width - 60, controllerScreenshot.size.height - 60)];
    fadedView.image = controllerScreenshot;
    fadedView.alpha = 0.4;
    [coverView addSubview:fadedView];
    
    UIImageView *leftCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    leftCurtain.image = selfPortrait;
    leftCurtain.clipsToBounds = YES;
    
    UIImageView *rightCurtain = [[UIImageView alloc] initWithFrame:CGRectNull];
    rightCurtain.image = selfPortrait;
    rightCurtain.clipsToBounds = YES;
    
    if (transitionStyle == RECurtainTransitionHorizontal) {
        leftCurtain.contentMode = UIViewContentModeLeft;
        leftCurtain.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
        rightCurtain.contentMode = UIViewContentModeRight;
        rightCurtain.frame = CGRectMake(self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
    } else {
        leftCurtain.contentMode = UIViewContentModeTop;
        leftCurtain.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2);
        rightCurtain.contentMode = UIViewContentModeBottom;
        rightCurtain.frame = CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2);
    }
    
    [coverView addSubview:leftCurtain];
    [coverView addSubview:rightCurtain];
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        if (transitionStyle == RECurtainTransitionHorizontal) {
            leftCurtain.frame = CGRectMake(- self.view.frame.size.width / 2, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
            rightCurtain.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width / 2, self.view.frame.size.height);
        } else {
            leftCurtain.frame = CGRectMake(0, - self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2);
            rightCurtain.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height / 2);
        }
    } completion:nil];
    
    [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationCurveEaseIn animations:^{
        fadedView.frame = CGRectMake(0, offset, controllerScreenshot.size.width, controllerScreenshot.size.height);
        fadedView.alpha = 1;
    } completion:^(BOOL finished){
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        appDelegate.window.rootViewController = viewControllerToReveal;
        [leftCurtain removeFromSuperview];
        [rightCurtain removeFromSuperview];
        [fadedView removeFromSuperview];
        [coverView removeFromSuperview];
    }];
}

@end
