//
//  DrugsItemView.h
//  Medicine
//
//  Created by MT on 15/6/9.
//  Copyright (c) 2015年 sx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrugsItemViewDelegate;

@interface DrugsItemView : UIView
{
    NSInteger _index;
    __weak IBOutlet UIImageView *_iconIV;
}

@property (nonatomic,assign) id<DrugsItemViewDelegate> delegate;

- (IBAction)onDeleteItemClicked:(id)sender; 

+ (DrugsItemView *)viewFromXib;

- (void)updateData:(NSString *)url index:(NSInteger)index;

@end

////////////////////
@protocol DrugsItemViewDelegate <NSObject>

- (void)deleteItemWithIndex:(NSInteger)index;

@end
