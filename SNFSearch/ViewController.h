//
//  ViewController.h
//  SNFSearch
//
//  Created by Nash Gadre on 6/3/16.
//  Copyright © 2016 Gadre.XYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLParallaxController/SLParallaxController.h"

@interface ViewController : UIViewController<SLParallaxControllerDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) SLParallaxController *parallax;
@property (nonatomic, strong) CLLocationManager* locationManager;

@end

