//
//  PrincipalViewController.h
//  OPACO
//
//  Created by usuario on 20/03/13.
//  Copyright (c) 2013 usuario. All rights reserved.
// subido   

#import <UIKit/UIKit.h>

#import "BViewController.h"

@interface PrincipalViewController : UIViewController

@property (strong, nonatomic) BViewController *aViewController;

- (IBAction)llamarA:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnA;
@property(weak, nonatomic) IBOutlet UIView *windowIntermedio;


@end
