//
//  FlashcardModel.h
//  Flashining
//
//  Created by Jeehyung Lee on 6/5/13.
//  Copyright (c) 2013 Jeehyung Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface FlashcardModel : NSObject

@property (nonatomic, readonly) NSManagedObjectContext *mainContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedDataModel;
- (NSString *)modelName;
- (NSString *)pathToModel;
- (NSString *)storeFilename;
- (NSString *)pathToLocalStore;
@end
