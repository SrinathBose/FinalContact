//
//  AppDelegate.h
//  Contacs
//
//  Created by Srinath Bose on 1/17/17.
//  Copyright © 2017 Trimble. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{

    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}
@property(nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property(strong, nonatomic) UIWindow *window;
@property(readonly, strong) NSPersistentContainer *persistentContainer;

- (NSString *)applicationDocumentsDirectory;
- (void)saveContext;

@end
