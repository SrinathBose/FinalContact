//
//  PersonDetailsTableViewController.m
//  Tab_Demo
//
//  Created by Srinath Bose on 1/10/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "PersonDetailsTableViewController.h"

#define destinationViewName "DetailedContact"
#define cellName "PersonCell"
#define addContactIdentifier "AddContactViewController"
#define contactIconIdentifier "contact-icon.png"
#define tableName "Contacts"

@interface PersonDetailsTableViewController()

@property(strong, nonatomic) ContactManager *contactManager;
@property(strong, nonatomic, readwrite) NSArray *contacts;
- (IBAction)addContactClicked:(id)sender;
- (IBAction)addBulkContacts:(id)sender;

@end

@implementation PersonDetailsTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _contactManager = [[ContactManager alloc]initWithDataSourceType:Database];
    _contacts = [_contactManager getContacts];
}

- (void)viewWillAppear:(BOOL)animated
{
    _contacts = [_contactManager getContacts];
    [self.tableView reloadData]; // Reload All the data
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contacts count]; // Returns the total number of objects in oFamily object.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Set content for UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@cellName];
    cell.indentationLevel = [[NSNumber numberWithInteger:3] intValue];
    cell.imageView.image = [UIImage imageNamed:@contactIconIdentifier];

    Person *personObj = (self.contacts)[indexPath.row]; // Creating an object for a person
    cell.textLabel.text = personObj.nameString;         // Assigning data source to the TableView
    cell.detailTextLabel.text = [personObj.phoneNumber stringValue];

    return cell; // Returns cell
}

// Delete Contact From Table
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_contactManager deleteContact:[self.contacts objectAtIndex:indexPath.row]];
    _contacts = [_contactManager getContacts];
    [tableView reloadData];
}

// Perform selection operation on UITableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactDisplayViewController *contactDisplayViewController = (ContactDisplayViewController *)
                    [self.storyboard instantiateViewControllerWithIdentifier:@destinationViewName]; // Select the particular view
    [contactDisplayViewController setPerson:[self.contacts objectAtIndex:indexPath.row]];
    [contactDisplayViewController setContactManager:_contactManager];
    [self.navigationController pushViewController:contactDisplayViewController animated:YES];  // Navigating
}

#pragma ADD contact button pressed

- (IBAction)addContactClicked:(id)sender
{
    AddContactViewController *addContact = [self.storyboard instantiateViewControllerWithIdentifier:@addContactIdentifier];
    [addContact setContactManager:_contactManager];
    [[self navigationController] pushViewController:addContact animated:YES];
}

#pragma Adding Bulk Contacts Using Threads

- (IBAction)addBulkContacts:(id)sender
{
    [NSThread detachNewThreadSelector:@selector(newContactThread) toTarget:self withObject:nil];
}

// Selector Thread for create bulk contacts
- (void)newContactThread
{
    for (int i = 0; i < 10; i++) {
        NSString *nameString = [self genarateRandomString];
        NSString *addressString = [self genarateRandomString];
        NSString *cityString = [self genarateRandomString];
        int randAge = arc4random_uniform(99);
        NSNumber *ageNumber = [NSNumber numberWithInt:randAge];
        int randPhone = arc4random_uniform(1000000000);
        NSNumber *phoneNumber = [NSNumber numberWithInt:randPhone];

        Person *personObj = [[Person alloc]init];
        [_contactManager addContact:[personObj initWithName:nameString phone:phoneNumber age:ageNumber address:addressString city:cityString]];

        _contacts = [_contactManager getContacts];
        [self.tableView reloadData];
    }
}

// Generate random strings for random contacts
- (NSString *)genarateRandomString
{
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
    int len = arc4random() % 26;
    NSMutableString *sRandString = [NSMutableString stringWithCapacity:len];
    for (int i = 0; i < len; i++)
        [sRandString appendFormat:@"%c", [letters characterAtIndex:arc4random()%len] + 1];

    return sRandString;
}

@end
