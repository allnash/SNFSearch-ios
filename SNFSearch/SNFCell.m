//
//  SNFCell.m
//  SNFSearch
//
//  Created by Nash Gadre on 6/3/16.
//  Copyright © 2016 Gadre.XYZ. All rights reserved.
//

#import "SNFCell.h"

@implementation SNFCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initializeCellWithItem:(NSDictionary *)dict{
    
    self.facilityNameLabel.text =  [dict valueForKey:@"name"];
    self.milesLabel.text  =  [NSString stringWithFormat:@"%.02f%@",[[dict valueForKey:@"distance"] floatValue], @" miles"];
    
}


@end
