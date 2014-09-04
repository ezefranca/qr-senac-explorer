//
//  LoginViewController.h
//  GameficationSenac
//
//  Created by Ezequiel Franca dos Santos on 02/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "MissoesViewController.h"
#import <AVFoundation/AVFoundation.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface LoginViewController : UIViewController

@property (nonatomic, strong) AVPlayer *avplayer;
@property (strong, nonatomic) IBOutlet UIView *movieView;
@property (strong, nonatomic) IBOutlet UIView *gradientView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

- (IBAction)botaoLogin:(id)sender;

@end
