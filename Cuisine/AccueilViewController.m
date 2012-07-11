//
//  FirstViewController.m
//  Cuisine
//
//  Created by SEKIMIA on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccueilViewController.h"

@interface AccueilViewController ()

@end

@implementation AccueilViewController
@synthesize dataController = _dataController;
@synthesize managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage *patternImage = [UIImage imageNamed:@"vichy.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
}

- (void)viewDidUnloads
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end