//
//  GrammarCell.m
//  ApplicationLibanais
//
//  Created by SEKIMIA on 11/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell
@synthesize lblTitle, lblCategory, imgPicture;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}



@end
