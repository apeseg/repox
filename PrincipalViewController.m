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
@synthesize aViewController, bViewController, cViewController;

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

/**
 * Método para detectar que vista es la que se desea llamar
 */
- (IBAction)cambiarVista:(id)sender {
    
    int i = [sender tag];
    
    switch (i) {
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            [self.windowIntermedio removeFromSuperview];
            [self removerVista:i];
            self.aViewController = [[AViewController alloc] initWithNibName:@"AViewController" bundle:nil];
            self.aViewController.view.frame = CGRectMake(0, 117, 1024, 501);
            [self.view insertSubview:self.aViewController.view atIndex:0];
            break;
        case 2:
            [self.windowIntermedio removeFromSuperview];
            [self removerVista:i];
            self.bViewController = [[BViewController alloc] initWithNibName:@"BViewController" bundle:nil];
            self.bViewController.view.frame = CGRectMake(0, 117, 1024, 501);
            [self.view insertSubview:self.bViewController.view atIndex:0];
            break;
        case 3:
            [self.windowIntermedio removeFromSuperview];
            [self removerVista:i];
            self.cViewController = [[CViewController alloc] initWithNibName:@"CViewController" bundle:nil];
            self.cViewController.view.frame = CGRectMake(0, 117, 1024, 501);
            [self.view insertSubview:self.cViewController.view atIndex:0];
            break;
        default:
            break;
    }
    
}

- (void) removerVista:(int) vista {
    
    switch (vista) {
        case 1:
            if ([self esVisible:self.bViewController.view]) {
                [self.bViewController.view removeFromSuperview];
            } else if ([self esVisible:self.cViewController.view]) {
                [self.cViewController.view removeFromSuperview];
            }
            break;
        case 2:
            if ([self esVisible:self.aViewController.view]) {
                [self.aViewController.view removeFromSuperview];
            } else if ([self esVisible:self.cViewController.view]) {
                [self.cViewController.view removeFromSuperview];
            }
            break;
        case 3:
            if ([self esVisible:self.aViewController.view]) {
                [self.aViewController.view removeFromSuperview];
            } else if ([self esVisible:self.bViewController.view]) {
                [self.bViewController.view removeFromSuperview];
            }
            break;
        default:
            break;
    }
    
}

- (BOOL) esVisible:(UIView *) view {
    return view.superview != nil;
}

@end
