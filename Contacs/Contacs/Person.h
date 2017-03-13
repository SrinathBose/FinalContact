//
//  Person.h
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (id)initWithName:(NSString *)sName phone:(NSNumber *)nPhone age:(NSNumber *)nAge address:(NSString *)sAddress city:(NSString *)sCity;
@property(strong, atomic, readwrite) NSString *nameString;
@property(strong, atomic, readwrite) NSString *addressString;
@property(strong, atomic, readwrite) NSString *cityString;
@property(strong, atomic, readwrite) NSNumber *ageNumber;
@property(strong, atomic, readwrite) NSNumber *phoneNumber;

@end
