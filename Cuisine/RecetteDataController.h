//
//  RecetteDataController.h
//  Cuisine
//
//  Created by SEKIMIA on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Recette;

typedef enum 
{
    ALL,
    ENTREE,
    PLAT,
    DESSERT,
    FAVORI,
    TOPTEN,
} RecetteType;

@interface RecetteDataController : NSObject
{
    NSMutableArray *all;
    NSMutableArray *entrees;
    NSMutableArray *plats;
    NSMutableArray *desserts;
}

@property (nonatomic, copy) NSMutableArray *masterRecetteList;
@property (strong, nonatomic) NSMutableArray *all;
@property (strong, nonatomic) NSMutableArray *entrees;
@property (strong, nonatomic) NSMutableArray *plats;
@property (strong, nonatomic) NSMutableArray *desserts;

- (NSUInteger)countOfList;
- (Recette *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addRecette:(Recette *)recette;
- (NSMutableArray *)getRecettes:(RecetteType)type;

@end
