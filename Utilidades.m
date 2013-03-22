//
//  Utilidades.m
//  OPACO
//
//  Created by usuario on 22/03/13.
//  Copyright (c) 2013 usuario. All rights reserved.
//

#import "Utilidades.h"

@implementation Utilidades


/*
 * Metodo para consultar si se esta mo9streando el panel
 */

- ( BOOL ) seMuestraPanelIzquierdo:(NSString *) titulo {
        NSLog(@"titulo: %@", titulo);
    if (titulo == @">>") {
        return NO;
    } else {
        return YES;
    }

}

@end
