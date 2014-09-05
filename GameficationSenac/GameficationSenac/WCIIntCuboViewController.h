//
//  WCIIntCuboViewController.h
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 05/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "CNBluetoothCentral.h"
#import "webService.h"

#define rgb(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@interface WCIIntCuboViewController : UIViewController <CNBluetoothCentralDelegate>

@property BOOL conectado;
@property (nonatomic) NSInteger numberIntervencao;

- (IBAction)botaoEnviar:(id)sender;

- (void)enviarLixo;

@end
