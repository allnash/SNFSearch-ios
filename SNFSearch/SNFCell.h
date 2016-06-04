//
//  SNFCell.h
//  SNFSearch
//
//  Created by Nash Gadre on 6/3/16.
//  Copyright © 2016 Gadre.XYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNFCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *facilityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *milesLabel;

-(void)initializeCellWithItem:(NSDictionary *)dict;

@end
