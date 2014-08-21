//
//  StoreViewController.h
//  TkuGroup
//
//  Created by Shuo on 5/20/14.
//  Copyright (c) 2014 Shuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *storeImageView;

@property(weak, nonatomic) NSString *storeImageName;
@property (strong, nonatomic) IBOutlet UIButton *back;

@end
