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

//popover1
#import "PopOver1VC.h"

//seleccion pais
#import "PopoverViewController.h"

#import "Utilidades.h"

@interface PrincipalViewController : UIViewController {
    //popover1
    PopOver1VC *controller;
 
    //seleccion pais
    PopoverViewController *popOverSeleccionPais;
    UIPopoverController *popSeleccionPais;
    
    UIPopoverController *popoverController;
    
    // mostrar y ocultar panel izquierdo
    IBOutlet UIView *vistaPanelIzquierdo;
    IBOutlet UIButton *btnPanelIzquierdo;
}

@property (strong, nonatomic) BViewController *bViewController;
@property (strong, nonatomic) AViewController *aViewController;
@property (strong, nonatomic) CViewController *cViewController;

// POP OVERS1
@property (nonatomic,strong) IBOutlet UIButton *popOver1;
@property (weak, nonatomic) IBOutlet UIButton *modal;

// SELECCIONA PAIS
@property (nonatomic, retain) PopoverViewController *popOverSeleccionPais;
@property (nonatomic, retain) UIPopoverController *popSeleccionPais;

// Panel izquierdo
@property (nonatomic, strong) IBOutlet UIView *vistaPanelIzquierdo;
@property (nonatomic, strong) IBOutlet UIButton *btnPanelIzquierdo;
- (IBAction)btnMuevePanel:(id)sender;
@property (nonatomic, strong) Utilidades *utilidades;


- (IBAction)cambiarVista:(id)sender;


- (IBAction)popOver1:(id)sender;
- (IBAction)modal1:(id)sender;



@property(weak, nonatomic) IBOutlet UIView *windowIntermedio;


@end
