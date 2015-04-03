//
//  AFRGauge.h
//  TurboRanger
//
//  Created by Thomas Saunders on 4/2/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFRGauge : UIView {
    
}


@property IBOutlet UIImageView *gaugeBG;
@property IBOutlet UIView *needleHolder;
@property IBOutlet UISlider *afrChanger;
@property IBOutlet UIImageView *needleImage;
@property IBOutlet UILabel *afrLabel;

@property bool hasInitialized;
@property float AFR;

-(IBAction)afrChanged:(id)sender;

@end
