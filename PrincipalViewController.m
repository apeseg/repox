//
//  PrincipalViewController.m
//  OPACO
//
//  Created by usuario on 20/03/13.
//  Copyright (c) 2013 usuario. All rights reserved.
//

#import "PrincipalViewController.h"

#import "Modal1VC.h"


@interface PrincipalViewController ()

@end

@implementation PrincipalViewController

@synthesize aViewController, bViewController, cViewController;

//popover
@synthesize popOver1;

//seleccion pais
@synthesize popOverSeleccionPais, popSeleccionPais;

// panel izquierdo
@synthesize vistaPanelIzquierdo, btnPanelIzquierdo, utilidades;

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
    //popover 1
    controller = [[PopOver1VC alloc] initWithNibName:@"PopOver1VC" bundle:nil];
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    [btnPanelIzquierdo setTitle:@">>" forState:UIControlStateNormal];
    [vistaPanelIzquierdo setBackgroundColor:[UIColor orangeColor]];
    [vistaPanelIzquierdo setFrame:CGRectMake(-340, 0, 340, 501)];//CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
 
}

- (void)viewDidUnload
{
    [self setPopOver1:nil];
    [self setModal:nil];
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
- (IBAction)btnMuevePanel:(id)sender {
    
    NSLog(@"Label de boton: %@", btnPanelIzquierdo.titleLabel.text);
    
    utilidades = [[Utilidades alloc] init];
    
    if ([utilidades seMuestraPanelIzquierdo: btnPanelIzquierdo.titleLabel.text]) {
        [UIView animateWithDuration: 0.7
                         animations:^{
                             vistaPanelIzquierdo.frame = CGRectMake( -340,0,340,501); 
                             btnPanelIzquierdo.frame = CGRectMake( 0,35,45,45);
                         }
                         completion:^(BOOL finished){
                             [btnPanelIzquierdo setTitle:@">>" forState:UIControlStateNormal];
                         }];

    } else {
        NSLog(@"NO se estaba mostrando, ahora se va a mostrar");
        [UIView animateWithDuration: 0.7
                         animations:^{
                             vistaPanelIzquierdo.frame = CGRectMake( 0,0,340,501);
                             btnPanelIzquierdo.frame = CGRectMake( 341,35,45,45);
                         }
                         completion:^(BOOL finished){
                             [btnPanelIzquierdo setTitle:@"<<" forState:UIControlStateNormal];
                         }];

    }
    
    
}

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

// popover1
- (IBAction)popOver1:(id)sender {
    if ([popoverController isPopoverVisible]) {
        [popoverController dismissPopoverAnimated:YES];
    } else {
        CGRect popRect = CGRectMake(self.popOver1.frame.origin.x,
                                    self.popOver1.frame.origin.y,
                                    self.popOver1.frame.size.width,
                                    self.popOver1.frame.size.height);
        
        [popoverController presentPopoverFromRect:popRect
                                           inView:self.view
                         permittedArrowDirections:UIPopoverArrowDirectionAny
                                         animated:YES];
    }
}

- (IBAction)modal1:(id)sender {
    Modal1VC *modal = [[Modal1VC alloc] init];
    UINavigationController *navModal = [[UINavigationController alloc] initWithRootViewController:modal];
    navModal.modalPresentationStyle= UIModalPresentationFormSheet;
    navModal.view.superview.frame = CGRectMake(0, 0, 50, 50);
    [navModal setNavigationBarHidden:YES];
    [self presentModalViewController:navModal animated:YES];
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
