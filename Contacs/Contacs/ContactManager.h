//
//  ContactManager.h
//  Contacs
//
//  Created by Srinath Bose on 1/24/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IContact.h"

@interface ContactManager : NSObject

typedef enum DataSourceTypeEnum : NSUInteger
{
    Array,
    RemoteServer,
    Database
} DataSourceType;

@property(assign, nonatomic) DataSourceType selectedType;

- (id)initWithDataSourceType:(DataSourceType)type;
- (NSArray *)getContacts;
- (bool)addContact:(Person *)newPerson;
- (bool)deleteContact:(Person *)personToBeDelete;

@end
