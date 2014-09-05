//
//  WCIIntArvoreViewController.h
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 05/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreBluetooth/CBPeripheral.h>
#import "bluekitBle.h"

@interface WCIIntArvoreViewController : UIViewController<blueKitBLEDelegate>{
    bluekitBle *t;
    Boolean isConnect;
}

@property (strong, nonatomic) CBPeripheral *gConDev;

@property (weak, nonatomic) IBOutlet UISlider *gBle_LED_RSlider;

@property (weak, nonatomic) IBOutlet UISlider *gBle_LED_GSlider;

@property (weak, nonatomic) IBOutlet UISlider *gBle_LED_BSlider;

- (IBAction)doLedSliderChanged:(id)sender;

@end
