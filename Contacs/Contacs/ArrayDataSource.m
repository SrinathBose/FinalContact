//
//  ArrayDataSource.m
//  Contacs
//
//  Created by Srinath Bose on 3/7/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@property(atomic, strong) NSMutableArray *contacts;

@end
@implementation ArrayDataSource


@synthesize contacts;

- (id)init {

    if (self = [super init])
    {
        Person *personObj = [[Person alloc]init]; // Creating a Person
        NSString *nameString = @"B.Srinath";
        NSString *addressString = @"XXX";
        NSString *cityString = @"Sivakasi";
        NSNumber *ageNumber = [NSNumber numberWithUnsignedInteger:23];
        NSNumber *phoneNumber = [NSNumber numberWithLong:8148004133];

        contacts = [[NSMutableArray alloc]init];
        [contacts addObject:[personObj initWithName:nameString
                                              phone:phoneNumber
                                                age:ageNumber
                                            address:addressString
                                               city:cityString]];
    }

    return self;
}
- (NSArray *)getContacts
{
    return contacts;
}

- (bool)addContact:(Person *)newPerson
{
    [contacts addObject:newPerson];
    return true;
}

- (bool)deleteContact:(Person *)personToBeDelete
{
    [contacts removeObject:personToBeDelete];
    return true;
}

@end
