//
//  RecetteViewController.h
//  Cuisine
//
//  Created by SEKIMIA on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recette.h"
#import "SHK.h"

@interface RecetteViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblCategory;
@property (strong, nonatomic) IBOutlet UILabel *lblDifficulty;
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnFavoris;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Recette *recette;
@property (strong, nonatomic) IBOutlet UILabel *lblRating;
@property (strong, nonatomic) IBOutlet UILabel *lblIng;

@property (strong, nonatomic) IBOutlet UILabel *lblOrigin;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar1;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar2;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar3;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar4;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar5;

- (IBAction)editFavori:(id)sender;
-(IBAction)share:(id)sender;

@end
