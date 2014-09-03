//
//  WCILeitorQRViewController.h
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 03/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WCILeitorQRViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (weak, nonatomic) IBOutlet UIView *previewCamera;
@property (weak, nonatomic) IBOutlet UIButton *scan;

- (IBAction)comecaTerminaScan:(id)sender;

@end
