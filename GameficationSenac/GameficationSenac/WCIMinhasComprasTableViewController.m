//
//  WCIMinhasComprasTableViewController.m
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 04/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import "WCIMinhasComprasTableViewController.h"

@interface WCIMinhasComprasTableViewController (){
    NSArray *minhasCompras;
}

@end

@implementation WCIMinhasComprasTableViewController

#define SearchTimeOut 1

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    minhasCompras = [NSArray arrayWithObjects:@"Árveres & Luzes", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    t = [bluekitBle getSharedInstance];
    [t controlSetup:1];
    t.delegate = self;
    isConnect = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue{
    
}

- (IBAction)doSearchDev:(id)sender{
    [self DoSearch];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [minhasCompras count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"clicou");
    
    
    if([t.peripherals count] > 0 && t.peripherals != nil){
        self.gSelectDev = [t.peripherals firstObject];
        
        switch (indexPath.row) {
            case 0:
                [self performSegueWithIdentifier:@"toIntervencaoArvore" sender:self];
                break;
                
            default:
                break;
        }
    }
    
    else{
        [self ShowMessage:@"Não está conectado!" msg:@"Não há conexão bluetooth com a intervenção!"];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"minhasComprasCell" forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"minhasComprasCell"];
    }
    
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    cell.textLabel.text = [minhasCompras objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)bluekitDisconnect
{
    NSLog(@"bluekitDisconnect");
}


-(void) RxValueUpdate:(Byte *)buf
{
    if (t.activePeripheral != nil)
    {
        NSLog(@"connect!");
    }
}

-(void) deviceFoundUpdate:(CBPeripheral *)p
{
    printf("Do device Found Update");
}

-(void) disconnectBle
{
    [t cancelConnectPeripheral];
}


-(void) DoSearch
{
    t.peripherals = nil;
    
    if (t.activePeripheral)
    {
        [t cancelConnectPeripheral];
        t.peripherals = nil;
    }
    [t findBLEPeripherals:SearchTimeOut];
    [NSTimer scheduledTimerWithTimeInterval:(float)SearchTimeOut target:self selector:@selector(connectionTimer:) userInfo:nil repeats:NO];
}

-(void) connectionTimer:(NSTimer *)timer
{
	NSLog(@"%d", [t.peripherals count]);
}

-(void)ShowMessage:(NSString *) title msg:(NSString *) message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:@"Cancel", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self DoSearch];
    }
}

-(void)doStopIndicator{
    if(t.activePeripheral !=nil)
    {
        NSLog(@"Connected!");
    }
    else
    {
        NSLog(@"Disconnect");
    }
}

- (IBAction)doDeviceConnect:(id)sender {
    
    t = [bluekitBle getSharedInstance];
    if(t.activePeripheral)
    {
        [t controlSetup:1];
        t.delegate = self;
        [t cancelConnectPeripheral];
    }
    else
    {
        [self DoSearch];
        [self performSelector:@selector(doStopIndicator) withObject:nil afterDelay:5.0];
        
    }
}

-(void) updateRssiValue:(int)rssi
{
    
}
-(void) blueConnect
{
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(self.gSelectDev != nil){
        NSLog(@"set");
        id destVC = segue.destinationViewController;
        [destVC setValue:self.gSelectDev forKey:@"gConDev"];
    }
}

@end
