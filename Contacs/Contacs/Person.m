//
//  Person.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "Person.h"

@implementation Person
/**
 <#Description#>

 @param nameString -> Name of the person
 @param phoneNumber -> Phone Number of the person
 @param ageNumber -> Age of the person
 @param addressString -> Address of the person
 @param cityString -> City of the person
 @return new Contact
 */


- (id)initWithName:(NSString *)nameString phone:(NSNumber *)phoneNumber age:(NSNumber *)ageNumber address:(NSString *)addressString city:(NSString *)cityString
{
    
    if (self = [super init]) {
        self.nameString = nameString;
        self.phoneNumber = phoneNumber;
        self.ageNumber = ageNumber;
        self.addressString = addressString;
        self.cityString = cityString;
    }

    return self;
}

@end
