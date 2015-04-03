//
//  AFRGauge.m
//  TurboRanger
//
//  Created by Thomas Saunders on 4/2/15.
//  Copyright (c) 2015 Modern Carpentry. All rights reserved.
//

#import "AFRGauge.h"
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

#include <QuartzCore/QuartzCore.h>

@implementation AFRGauge



@synthesize gaugeBG;
@synthesize needleHolder;
@synthesize AFR;
@synthesize afrChanger;
@synthesize needleImage;
@synthesize afrLabel;
@synthesize hasInitialized;

-(id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if( self) {
        NSLog(@"Created AFR Gauge");
        self.AFR=0.0;
        
    }
    
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    if( ! self.hasInitialized){
        
        self.hasInitialized=YES;
        [self afrChanged:nil];
    }
}



-(IBAction)afrChanged:(id)sender{
    
    float newval = self.afrChanger.value;
    self.AFR = newval;
    
    //input from arduino will be between 0 and 1023
    //we need to map that to the available range of the afr slider
    //the number of radians between 10 afr and 18.6afr is about 4.75
    float mappedValue = (self.AFR / 1023.0f) * 4.75f;
    
    //get the display afr ( number between 10 and 18.6 )
    double displayAFR = 10.0f + (mappedValue * 1.81);
    
    [self.afrLabel setText:[NSString stringWithFormat:@"%.02f AFR", displayAFR]];
    
    //then we subtract about .5 radian because 10 afr is actual a negative radian value
    mappedValue = mappedValue - 0.56f;
    
    [UIView beginAnimations:nil context:NULL];
    
    CGAffineTransform t = CGAffineTransformMakeRotation(mappedValue);
    [self.needleHolder setTransform:t];
    [UIView commitAnimations];
}


@end
