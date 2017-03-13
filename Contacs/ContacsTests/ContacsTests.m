//
//  ContacsTests.m
//  ContacsTests
//
//  Created by Srinath Bose on 3/3/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContactManager.h"
#import "Person.h"
#import "AddContactViewController.h"

@interface ContacsTests : XCTestCase

@property(nonatomic)  ContactManager *contactManager;
@property(nonatomic)  AddContactViewController *addContactViewController;


@end

@implementation ContacsTests


- (void)setUp
{
    [super setUp];

    self.contactManager = [[ContactManager alloc]initWithDataSourceType:Database];
    self.addContactViewController = [[AddContactViewController alloc]init];
}

- (void)testUserInputs
{
    bool isContactValid = [_addContactViewController validateContact:@"Sri"
                                         phone:[NSNumber numberWithLong:9643456645]
                                       address:@"XXX"
                                           age:[NSNumber numberWithInt:21]
                                          city:@"YYY"];
    XCTAssertEqual(true, isContactValid,@"Invalid Inputs");
}
- (void)testAddContact
{
    bool isContactAddedSuccessfully = [_contactManager addContact:
                                       [[Person alloc]initWithName:@"Sri"
                                                             phone:[NSNumber numberWithInt:12345]
                                                               age:[NSNumber numberWithInt:21]
                                                           address:@"XXX"
                                                              city:@"YYY"]];
    XCTAssertEqual(true, isContactAddedSuccessfully, @"Data  Not Saveed");
}

- (void)testDeleteContact
{
    bool isContactDeletedSuccessfully = [_contactManager deleteContact:
                                         [[Person alloc]initWithName:@"Sri"
                                                               phone:[NSNumber numberWithInt:12345]
                                                                 age:[NSNumber numberWithInt:21]
                                                             address:@"XXX"
                                                                city:@"YYY"]];

    XCTAssertEqual(true, isContactDeletedSuccessfully, @"Data  Not Saveed");
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
