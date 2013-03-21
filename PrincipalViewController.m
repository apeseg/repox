//
//  PrincipalViewController.m
//  OPACO
//
//  Created by usuario on 20/03/13.
//  Copyright (c) 2013 usuario. All rights reserved.
//

#import "PrincipalViewController.h"

@interface PrincipalViewController ()

@end

@implementation PrincipalViewController
@synthesize btnA, aViewController;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setBtnA:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)llamarA:(id)sender {
    [self.windowIntermedio removeFromSuperview];
    self.aViewController = [[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
    [self.view insertSubview:self.aViewController.view atIndex:0];
}

@end
