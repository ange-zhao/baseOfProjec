//
//  DrugsItemView.m
//  Medicine
//
//  Created by MT on 15/6/9.
//  Copyright (c) 2015年 sx. All rights reserved.
//

#import "DrugsItemView.h"

@implementation DrugsItemView



+ (DrugsItemView *)viewFromXib
{
    DrugsItemView *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])owner:self options:nil] objectAtIndex:0];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)updateData:(NSString *)url index:(NSInteger)index
{
    _index = index;
    _iconIV.image = [UIImage imageNamed:@"background_googds.png"];
}

- (IBAction)onDeleteItemClicked:(id)sender
{
    if ( _delegate && [_delegate respondsToSelector:@selector(deleteItemWithIndex:)]) {
        [_delegate deleteItemWithIndex:_index];
    }
}

@end
