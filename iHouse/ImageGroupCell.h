//
//  ImageGroupCell.h
//  iHouse
//
//  Created by HelloYou on 8/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGroupCell : UITableViewCell
+ (NSInteger) numberOfPlaceHolders;
- (void) addGroupView:(UIView *)groupView atIndex:(NSInteger)index;
@end
