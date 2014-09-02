//
//  BluetoothViewController.m
//  GameficationSenac
//
//  Created by Ezequiel Franca dos Santos on 02/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import "BluetoothViewController.h"

@interface BluetoothViewController ()

@end

@implementation BluetoothViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.conectado = FALSE;

    [[CNBluetoothCentral sharedBluetoothCentral] setDelegate:self];
    
    //    (void)setBackgroundColor:(UIColor*)color; // default is [UIColor whiteColor]
    //    + (void)setForegroundColor:(UIColor*)color; // default is [UIColor blackColor]
    //    + (void)setRingThickness:(CGFloat)width; // default is 4 pt
    //    + (void)setFont:(UIFont*)font; // default is [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline]
    //    + (void)setSuccessImage:(UIImage*)image; // default is bundled success image from Glyphish
    //    + (void)setErrorImage:(UIImage*)image; // default is bundled error image from Glyphish
    
}
- (void)handleNotification:(NSNotification *)notif{
    NSLog(@"Notification recieved: %@", notif.name);
}

- (void)viewDidLoad{
    //Create the items

}


- (void)viewWillDisappear:(BOOL)animated{

    [[CNBluetoothCentral sharedBluetoothCentral] cleanup];
    [[CNBluetoothCentral sharedBluetoothCentral] setDelegate:nil];
}
-(void)viewDidAppear:(BOOL)animated{

}

- (IBAction)botaoConectar:(id)sender {
    NSLog(@"Conectando...");
    [[CNBluetoothCentral sharedBluetoothCentral] startCentral];
}

- (void)didReceiveMemoryWarning{
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

#pragma mark CNBlueToothCentralDelegate
- (void)scanStarted {
    NSLog(@"Escaneando");
}

- (void)centralDidNotStart:(NSString *)errorString {
    //UIAlert to warn about this error
    NSLog(@"Erro!!!");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message: errorString delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
    
}

- (void)centralConnectedwithPeripheral:(CBPeripheral *)peripheral withError:(NSError *)error {
    //Alert user that peripheral connected successfully
    NSLog(@"Conectar");
}

- (void)centralDisconnectwithPeripheral:(CBPeripheral *)peripheral withError:(NSError *)error {
    NSLog(@"Desconectado");
}

- (void)centralReadCharacteristic:(CBCharacteristic *)characteristic withPeripheral:(CBPeripheral *)peripheral withError:(NSError *)error {
    NSUInteger i;
    NSMutableString *str;
    
    //Append the received string into the bottom text view
    NSMutableString *temp = [[NSMutableString alloc] initWithData:characteristic.value encoding:NSUTF8StringEncoding];
    // Show it on log
    NSLog(@"%@", temp);
    // Ignora os caracteres nulos "\0"
    for (i = 0 ; i < temp.length ; i++){
        if ([temp characterAtIndex:i] != '\0'){
            // Constroe a nova string
            if(i == 0)
                str = [NSMutableString stringWithFormat:@"%C",[temp characterAtIndex:i]];
            else{
                str = [NSMutableString stringWithFormat:@"%@%C", str, [temp characterAtIndex:i]];
            }
        }
    }
    // Display the single-character string
    // Reset used variables
    temp = (NSMutableString *)@"";
    str = (NSMutableString *)@"";
}

- (void)centralWroteCharacteristic:(CBCharacteristic *)characteristic withPeripheral:(CBPeripheral *)peripheral withError:(NSError *)error {
    //UIAlert confirm to user that BLE send was successful (optional)
}

-(void)enviarLixo{
    //Metodo de enviar
    NSString *enviar = @"$teste";

    [self enviarDadosBluetooth:enviar];
}

- (void)enviarDadosBluetooth:(NSString *)tipoLixo{
    
    NSUInteger i;
    NSMutableString *str;
    NSString *temp;
    
    NSLog(@"Enviar");
    
    if ([[CNBluetoothCentral sharedBluetoothCentral] isConnected]) {
        
        // Get the string entered by the user
        temp = tipoLixo;
        
        // Ignora os caracteres nulos "\0"
        for (i = 0 ; i < temp.length ; i++){
            if ([temp characterAtIndex:i] != '\0'){
                // Constroe a nova string
                if(i == 0)
                    str = [NSMutableString stringWithFormat:@"%C",[temp characterAtIndex:i]];
                else{
                    str = [NSMutableString stringWithFormat:@"%@%C", str, [temp characterAtIndex:i]];
                }
            }
        }
        // Teste de envio
        //        str = [NSMutableString stringWithFormat:@"%@", @"$1988$0004"];
        NSLog(@"%@", temp);
        [[CNBluetoothCentral sharedBluetoothCentral] sendDataWithoutResponse:temp];
        
        // Resetar as variaveis usadas
        temp = (NSString *)@"";
        str = (NSMutableString *)@"";
        
    }
    else{
        //UIAlert user that we are not connected or no characters were entered
    }
    
}

//- (IBAction)botaoSettings:(id)sender {
//    SettingsViewController *t = [[SettingsViewController alloc]init];
//    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:t];
//    [self navegacaoManeira:nc];
//}

- (IBAction)botaoEnviar:(id)sender {
    if ([self conectado]) {
        UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Selecione o tipo de lixo:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                                @"Papel",
                                @"Plastico",
                                @"Metal",
                                @"Vidro",
                                nil];
        popup.tag = 1;
        [popup showInView:[UIApplication sharedApplication].keyWindow];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    switch (buttonIndex) {
//        case 0:
//            [self setTipo:1];
//            break;
//        case 1:
//            [self setTipo:2];
//            break;
//        case 2:
//            [self setTipo:3];
//            break;
//        case 3:
//            [self setTipo:4];
//            break;
//        default:
//            [self setTipo:0];
//            break;
//    }
    [self enviarLixo];
}
@end

