//
//  ContactManager.m
//  Contacs
//
//  Created by Srinath Bose on 1/24/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "ContactManager.h"
#import "ArrayDataSource.h"
#import "DatabaseDataSource.h"

@interface ContactManager()

{
    id<IContact> iContact;
}

@end

@implementation ContactManager


- (id)initWithDataSourceType:(DataSourceType)type
{
    if (self = [super init]) {
        _selectedType = type;

        if (_selectedType == Array) {

        iContact = [[ArrayDataSource alloc]init];
        } else if (_selectedType == Database) {

        iContact = [[DatabaseDataSource alloc]init];
        }
    }

    return self;
}

/**
 Method for get contacts from Data Source

 @return - array of contacts
 */
- (NSArray *)getContacts
{
    return [iContact getContacts];
}


/**
 Adding New Contact into Data source

 @param newPerson - new Person
 */
- (bool)addContact:(Person *)newPerson
{
    return [iContact addContact:newPerson];
}


/**
 Deleting a Person from contacts

 @param personToBeDelete - person to be delete
 */
- (bool)deleteContact:(Person *)personToBeDelete
{
    return [iContact deleteContact:personToBeDelete];
}

@end
