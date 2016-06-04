//
//  ViewController.m
//  SNFSearch
//
//  Created by Nash Gadre on 6/3/16.
//  Copyright © 2016 Gadre.XYZ. All rights reserved.
//

#import "ViewController.h"
#import "SLParallaxController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.parallax  = [SLParallaxController new];
    [self.view addSubview:self.parallax.view];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create a location manager
    self.locationManager = [[CLLocationManager alloc] init];
    // Set a delegate to receive location callbacks
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    // Start the location manager
    [self.locationManager startUpdatingLocation];
}

// Wait for location callbacks
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didTapOnMapView{

}

-(void)didTapOnTableView{

}

//These methods are called on the delegate when the tableView moved DOWN and UP.

-(void)didTableViewMoveDown{
}

-(void)didTableViewMoveUp{

}

@end
