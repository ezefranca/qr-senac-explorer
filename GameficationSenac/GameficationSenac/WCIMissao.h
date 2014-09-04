//
//  WCIMissao.h
//  GameficationSenac
//
//  Created by Danilo Makoto Ikuta on 04/09/14.
//  Copyright (c) 2014 Danilo Makoto Ikuta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCIMissao : NSObject

@property (nonatomic) NSInteger missionNumber;
@property (nonatomic, strong) NSString *missionName;
@property (nonatomic) BOOL isComplete;

@end
