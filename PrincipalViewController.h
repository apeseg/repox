//
//  PrincipalViewController.h
//  OPACO
//
//  Created by usuario on 20/03/13.
//  Copyright (c) 2013 usuario. All rights reserved.
// subido   

#import <UIKit/UIKit.h>

#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"

@interface PrincipalViewController : UIViewController

@property (strong, nonatomic) BViewController *bViewController;
@property (strong, nonatomic) AViewController *aViewController;
@property (strong, nonatomic) CViewController *cViewController;

- (IBAction)cambiarVista:(id)sender;

@property(weak, nonatomic) IBOutlet UIView *windowIntermedio;


@end
