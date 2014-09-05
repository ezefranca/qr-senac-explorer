//
//  WCITelaLoginViewController.m
//  GameficationSenac
//
//  Created by Ezequiel Franca dos Santos on 04/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import "WCITelaCadastroViewController.h"

@interface WCITelaCadastroViewController ()

@end

@implementation WCITelaCadastroViewController

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
    
    if ([self.nomeLogin respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.nomeLogin.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nome" attributes:@{NSForegroundColorAttributeName: color}];
    }
    
    if ([self.senhaLogin respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.senhaLogin.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Senha" attributes:@{NSForegroundColorAttributeName: color}];
    }
    
    if ([self.emailLogin respondsToSelector:@selector(setAttributedPlaceholder:)]) {
        UIColor *color = [UIColor whiteColor];
        self.emailLogin.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: color}];
    }
    
    
    [[[self nomeLogin] layer]setBorderWidth:2];
    self.nomeLogin.borderStyle = UITextBorderStyleRoundedRect;
    self.nomeLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    self.nomeLogin.layer.cornerRadius = 5;
    
    self.nomeLogin.clipsToBounds = YES;
    
    [[[self senhaLogin] layer]setBorderWidth:2];
    self.senhaLogin.borderStyle = UITextBorderStyleRoundedRect;
    self.senhaLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    self.senhaLogin.layer.cornerRadius = 5;
    
    self.senhaLogin.clipsToBounds = YES;
    
    [[[self emailLogin] layer]setBorderWidth:2];
    self.emailLogin.borderStyle = UITextBorderStyleRoundedRect;
    self.emailLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    self.emailLogin.layer.cornerRadius = 5;
    
    self.emailLogin.clipsToBounds = YES;
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)botaoCadastrar:(id)sender {
}
@end
