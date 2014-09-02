//
//  BluetoothViewController.h
//  GameficationSenac
//
//  Created by Ezequiel Franca dos Santos on 02/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CNBluetoothCentral.h"
#import "webService.h"

#define rgb(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface BluetoothViewController : UIViewController <CNBluetoothCentralDelegate>

@property BOOL conectado;

- (IBAction)botaoConectar:(id)sender;
- (IBAction)botaoEnviar:(id)sender;

- (void)enviarLixo;

@end
