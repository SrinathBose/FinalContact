//
//  AddContact.m
//  Contacs
//
//  Created by Srinath Bose on 1/19/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import "AddContactViewController.h"
#import "ErrorCodes.h"

@interface AddContactViewController ()

@property(nonatomic, strong) UITextField *currentTextField;
@property(weak, nonatomic) IBOutlet UITextField *nameTxt;
@property(weak, nonatomic) IBOutlet UITextField *numberTxt;
@property(weak, nonatomic) IBOutlet UITextField *addressTxt;
@property(weak, nonatomic) IBOutlet UITextField *cityTxt;
@property(weak, nonatomic) IBOutlet UITextField *ageTxt;

- (IBAction)createNewContact:(id)sender;
- (IBAction)cancelAddingContact:(id)sender;
- (void)showAlert:(NSString *)warningMessage;
- (void)showDoneButton;
- (bool)validatePhoneNumber:(NSNumber *)receivedPhoneNumber;
- (bool)validatAge:(NSNumber *)receivedAge;

@end

@implementation AddContactViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameTxt.delegate = self;
    self.numberTxt.delegate = self;
    self.addressTxt.delegate = self;
    self.cityTxt.delegate = self;
    self.ageTxt.delegate = self;

    [self showDoneButton];
}


/**
 Craate a new contact

 @param sender - id
 */
- (IBAction)createNewContact:(id)sender
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    NSString *nameString = _nameTxt.text;
    NSNumber *phoneNumber = [numberFormatter numberFromString:_numberTxt.text];
    NSString *addressString = _addressTxt.text;
    NSString *cityString = _cityTxt.text;
    NSNumber *ageNumber = [numberFormatter numberFromString:_ageTxt.text];

    if([self validateContact:nameString phone:phoneNumber address:addressString age:ageNumber city:cityString]) {

        // Creating Person object with obtained data
        Person *newContact = [[Person alloc]init];
        newContact = [newContact initWithName:nameString
                                        phone:phoneNumber
                                          age:ageNumber
                                      address:addressString
                                         city:cityString];
        [_contactManager addContact:newContact];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(bool)validateContact:(NSString *)nameString phone:(NSNumber *)phoneNumber address:(NSString *)addressString age:(NSNumber *)ageNumber city:(NSString *)cityString {

    do
    {
        if ([nameString isEqualToString:@""] || [addressString isEqualToString:@""] || [cityString isEqualToString:@""] ||
            [_ageTxt.text isEqualToString:@""] || [_numberTxt.text isEqualToString:@""]) {

            [self showAlert:[ErrorCodes getErrorMessageFromCode:1024]];
            return false;
        } else if (![self validatePhoneNumber:phoneNumber]) {

            [self showAlert:[ErrorCodes getErrorMessageFromCode:1025]];
            return false;

        } else if (![self validatAge:ageNumber]) {

            [self showAlert:[ErrorCodes getErrorMessageFromCode:1026]];
            return false;
        }
    } while(false);
    return true;
}

// validating Phone Number
- (bool)validatePhoneNumber:(NSNumber *)receivedPhoneNumber
{
    unsigned long lenghtOfThePhoneNumber = [[receivedPhoneNumber stringValue] length];

    if (lenghtOfThePhoneNumber == 10) {
        return true;
    }

    return false;
}

// validating Age
- (bool)validatAge:(NSNumber *)receivedAge
{
    unsigned int age = [receivedAge intValue];

    if (age < 100 && age > 0) {
        return true;
    }

    return false;
}

// This method is for perform cancel operation from adding a contact
- (IBAction)cancelAddingContact:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

// Show Alert , if the user entered invalid data or empty data
- (void)showAlert:(NSString *)warningMessage
{
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Alert"
                                message:warningMessage
                                preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok"
                                                 style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction *action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];

    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

// Dismiss the Keyboard
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES]; // YES ignores any textfield refusal to resign
}

// For tabbing purpose on UITextFields
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.nameTxt) {
        [textField resignFirstResponder];
        [self.numberTxt becomeFirstResponder];
    } else if (textField == self.addressTxt) {
        [textField resignFirstResponder];
        [self.cityTxt becomeFirstResponder];
    } else if (textField == self.cityTxt) {
        [textField resignFirstResponder];
        [self.ageTxt becomeFirstResponder];
    }

    return YES;
}

// Done button on keyboard
- (void)showDoneButton
{
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    toolBar.barStyle = UIBarStyleDefault;
    toolBar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                   target:nil action:nil],
                      [[UIBarButtonItem alloc]initWithTitle:@"NEXT" style:UIBarButtonItemStyleDone
                                                     target:self action:@selector(nextButtonPressed)]];

    [toolBar sizeToFit];
    _ageTxt.inputAccessoryView = toolBar;
    _numberTxt.inputAccessoryView = toolBar;
}

// Perform action on Pressing next button in keyboard
- (void)nextButtonPressed
{
    if (_currentTextField == self.numberTxt) {
        [self.numberTxt resignFirstResponder];
        [self.addressTxt becomeFirstResponder];
    } else {
        [self.ageTxt resignFirstResponder];
    }
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _currentTextField = textField;
    
    return YES;
}

@end
