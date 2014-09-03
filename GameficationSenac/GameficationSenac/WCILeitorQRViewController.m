//
//  WCILeitorQRViewController.m
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 03/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import "WCILeitorQRViewController.h"

@interface WCILeitorQRViewController ()

@property (nonatomic) BOOL estaScaneando;
@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation WCILeitorQRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.estaScaneando = NO;
    
    self.captureSession = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)comecaTerminaScan:(id)sender{
    if(!self.estaScaneando){
        if([self comecaScan]){
            self.estaScaneando = YES;
            [self.scan setTitle:@"Pare" forState:UIControlStateNormal];
        }
    }
    
    else{
        self.estaScaneando = NO;
        [self terminaScan];
        [self.scan setTitle:@"Scan QR Code" forState:UIControlStateNormal];
    }
}

- (BOOL)comecaScan{
    NSError *erro;
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&erro];
    
    if(!input){
        NSLog(@"%@", [erro localizedDescription]);
        return NO;
    }
    
    self.captureSession = [[AVCaptureSession alloc]init];
    [self.captureSession addInput:input];
    
    AVCaptureMetadataOutput *meta = [[AVCaptureMetadataOutput alloc]init];
    [self.captureSession addOutput:meta];
    
    dispatch_queue_t captureQueue;
    captureQueue = dispatch_queue_create("captureQueue", NULL);
    [meta setMetadataObjectsDelegate:self queue:captureQueue];
    [meta setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.captureSession];
    [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.previewLayer setFrame:self.previewCamera.bounds];
    [self.previewCamera.layer addSublayer:self.previewLayer];
    
    [self.captureSession startRunning];
    
    return YES;
}

- (void)terminaScan{
    [self.captureSession stopRunning];
    self.captureSession = nil;
    
    [self.previewLayer removeFromSuperlayer];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if(metadataObjects != nil && [metadataObjects count] > 0){
        AVMetadataMachineReadableCodeObject *meta = [metadataObjects firstObject];
        if([[meta type]isEqualToString:AVMetadataObjectTypeQRCode]){
            NSLog(@"%@", [meta stringValue]);
                
            [self performSelectorOnMainThread:@selector(terminaScan) withObject:nil waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(mudaTitulo:) withObject:[NSArray arrayWithObjects:@"Scan QR Code", [NSNumber numberWithUnsignedInteger:UIControlStateNormal], nil] waitUntilDone:NO];
                
            self.estaScaneando = NO;
        }
    }
}

//performSelector inútil!
- (void)mudaTitulo:(NSArray *)array{
    NSString *str = [array firstObject];
    NSNumber *n = [array objectAtIndex:1];
    
    [self.scan setTitle:str forState:[n unsignedIntegerValue]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end