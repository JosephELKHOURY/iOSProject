//
//  SecondViewController.m
//  Cuisine
//
//  Created by SEKIMIA on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RecettesViewController.h"

@interface RecettesViewController ()

@end

@implementation RecettesViewController
@synthesize dataController = _dataController;
@synthesize managedObjectContext;
@synthesize tblRecettes;
@synthesize segFilter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Recette" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) 
    {
        // Handle the error.
    }
    [self.dataController setMasterRecetteList:mutableFetchResults];
    
    /*Recette *recette = (Recette *)[NSEntityDescription insertNewObjectForEntityForName:@"Recette" inManagedObjectContext:managedObjectContext];

    recette.name = @"Titre de la recette";
    recette.category = @"Entrée";

    [self.dataController addRecette:recette];
    [[self tblRecettes] reloadData];

    if (![managedObjectContext save:&error])
    {
        // Handle the error.
    }*/
}

- (void)viewDidUnload
{
    [self setTblRecettes:nil];
    [self setSegFilter:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(segFilter.selectedSegmentIndex == 0)
        return [self.dataController countOfList];
    else if(segFilter.selectedSegmentIndex == 1)
        return [[self.dataController getEntrees] count];
    else if(segFilter.selectedSegmentIndex == 2)
        return [[self.dataController getPlats] count];
    else if(segFilter.selectedSegmentIndex == 3)
        return [[self.dataController getDesserts] count];
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"RecetteCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Recette *recette;
    
    if(segFilter.selectedSegmentIndex == 0)
        recette = [self.dataController objectInListAtIndex:indexPath.row];
    else if(segFilter.selectedSegmentIndex == 1)
        recette = [[self.dataController getEntrees] objectAtIndex:indexPath.row];
    else if(segFilter.selectedSegmentIndex == 2)
        recette = [[self.dataController getPlats] objectAtIndex:indexPath.row];
    else if(segFilter.selectedSegmentIndex == 3)
        recette = [[self.dataController getDesserts] objectAtIndex:indexPath.row];
    
    [[cell textLabel] setText:recette.name];
    [[cell detailTextLabel] setText:recette.category];
    
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowRecetteDetails"]) 
    {
        RecetteViewController *detailViewController = [segue destinationViewController];
        
        if(segFilter.selectedSegmentIndex == 0)
            detailViewController.recette = [self.dataController objectInListAtIndex:[self.tblRecettes indexPathForSelectedRow].row];
        else if(segFilter.selectedSegmentIndex == 1)
            detailViewController.recette = [[self.dataController getEntrees] objectAtIndex:[self.tblRecettes indexPathForSelectedRow].row];
        else if(segFilter.selectedSegmentIndex == 2)
            detailViewController.recette = [[self.dataController getPlats] objectAtIndex:[self.tblRecettes indexPathForSelectedRow].row];
        else if(segFilter.selectedSegmentIndex == 3)
            detailViewController.recette = [[self.dataController getDesserts] objectAtIndex:[self.tblRecettes indexPathForSelectedRow].row];
        
        detailViewController.managedObjectContext = self.managedObjectContext;
    }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)didFilter:(id)sender
{
    [tblRecettes reloadData];
}
@end