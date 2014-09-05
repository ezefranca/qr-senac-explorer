//
//  WCIMinhasComprasTableViewController.h
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 04/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bluekitBle.h"
#import <CoreBluetooth/CBPeripheral.h>

@interface WCIMinhasComprasTableViewController : UITableViewController<blueKitBLEDelegate, UITableViewDataSource>
{
    bluekitBle *t;
    Boolean isConnect;
}

@property (weak, nonatomic) IBOutlet CBPeripheral *gSelectDev;

- (IBAction)doSearchDev:(id)sender;

@end
