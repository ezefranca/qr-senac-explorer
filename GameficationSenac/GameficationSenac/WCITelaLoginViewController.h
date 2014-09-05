//
//  WCITelaLoginViewController.h
//  GameficationSenac
//
//  Created by Ezequiel Franca dos Santos on 04/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCITelaLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nomeLogin;
@property (weak, nonatomic) IBOutlet UITextField *senhaLogin;

#define rgb(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

- (IBAction)botaoLogin:(id)sender;

@end
