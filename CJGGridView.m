//
//  CJGGridView.m
//
//
//  Created by Conor Griffin on 30/12/2013.
//  Copyright (c) 2013 Conor Griffin. All rights reserved.
//

#import "CJGGridView.h"

@implementation CJGGridView

- (id)initWithSquareSize:(float)squareSize
{
    self = [super init];
    if (self) {
        self.squareSize = squareSize;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];

    CGPoint boardOrigin;

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    boardOrigin.y = self.squareSize * 7;
    
    for(int row = 0; row < 8; row++) {
        
        for(int column = 0; column < 8; column++) {
            
            CGRect square = {
                boardOrigin.x + (column * self.squareSize),
                boardOrigin.y - (row * self.squareSize),
                self.squareSize,
                self.squareSize};
            
            if((row + column) % 2 == 0) {
                // a dark blue
                CGContextSetRGBFillColor(context, 0.02, 0.28, 0.48, 1.00);
            }
            else {
                // a light blue
                CGContextSetRGBFillColor(context, 0.34, 0.72, 1.00, 1.00);
            }
            
            CGContextFillRect(context, square);
            CGContextStrokeRect(context, square);
            
        }
        
    }
    
    // Add a nice gradient overlay
    CAGradientLayer* gradientOverlay = [CAGradientLayer layer];
    gradientOverlay.frame = rect;
    
    gradientOverlay.colors = [NSArray arrayWithObjects:(id)
                              [UIColor colorWithRed:0. green:0. blue:0. alpha:0.7].CGColor,
                              [UIColor colorWithRed:0. green:0. blue:0. alpha:0.99].CGColor,
                              nil];
                              
    gradientOverlay.locations = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0.0],
                                 [NSNumber numberWithFloat: (self.squareSize * 6) / self.frame.size.height],
                                 nil];
                                 
    gradientOverlay.startPoint = CGPointMake(0.1, 0.1);
    gradientOverlay.endPoint = CGPointMake(1, 1);
    
    [self.layer setMask:gradientOverlay];

}

@end
