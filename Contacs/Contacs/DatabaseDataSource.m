//
//  DatabaseDataSource.m
//  Contacs
//
//  Created by Srinath Bose on 3/7/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "DatabaseDataSource.h"
#import "UIKit/UIKit.h"
#import "Contacts+CoreDataProperties.h"

#define tableName "Contacts"

@implementation DatabaseDataSource


- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];

    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }

    return context;
}

// get contacts from Database
- (NSArray *)getContacts
{
    NSMutableArray *contacts = [[NSMutableArray alloc]init];

    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@tableName];
    contacts = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSLog(@"Contacts Size Is %ld", (unsigned long)[contacts count]);

    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:[contacts count]];

    // Converting NSManagedObject into Person
    for (Contacts *contactsObj in contacts) {
        Person *person = [[Person alloc]initWithName:contactsObj.nameStr
                                               phone:[NSNumber numberWithInteger:contactsObj.phoneInt]
                                                 age:[NSNumber numberWithInteger:contactsObj.ageInt]
                                             address:contactsObj.addressStr
                                                city:contactsObj.cityStr];
        [tempArray addObject:person];
    }

    return tempArray;
}

// Save contact to database
- (bool)addContact:(Person *)newPerson {
    bool isContactAddedSuccessfully = true;
    NSManagedObjectContext *context = [self managedObjectContext];
    Contacts *contactsObj = [NSEntityDescription insertNewObjectForEntityForName:@tableName inManagedObjectContext:context];

    [contactsObj setNameStr:newPerson.nameString]; // Initialize Data for new Contact.
    [contactsObj setPhoneInt:[newPerson.phoneNumber intValue]];
    [contactsObj setAgeInt:[newPerson.ageNumber intValue]];
    [contactsObj setAddressStr:newPerson.addressString];
    [contactsObj setCityStr:newPerson.cityString];

    NSError *error = nil;

    if (![context save:&error]) {
        isContactAddedSuccessfully = false; // Setting add contact status for testing
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }

    return isContactAddedSuccessfully;
}

// Delete contact from database
- (bool)deleteContact:(Person *)personToBeDelete
{
    bool isContactDeletedSuccessfully;
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@tableName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"phoneInt == %@", personToBeDelete.phoneNumber];
    Contacts *delPerson = [[context executeFetchRequest:fetchRequest error:nil] objectAtIndex:0];

    [context deleteObject:delPerson];  // Deleting a Person

    NSError *error = nil;

    if (![context save:&error]) {
        isContactDeletedSuccessfully = false; // Setting  delete status for testing
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
    }

    return isContactDeletedSuccessfully;
}

@end
