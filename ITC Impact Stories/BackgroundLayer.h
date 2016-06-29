//
//  BackgroundLayer.h
//  ITC Impact Stories
//
//  Created by Tarek Benoudina on 26/06/16.
//  Copyright © 2016 ITC/United Nations. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BackgroundLayer : NSObject

+(CAGradientLayer*) greyGradient;
+(CAGradientLayer*) blueGradient;

@end