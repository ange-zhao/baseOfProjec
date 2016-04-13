//
//  HomeCollectionCell.h
//  MyOwn
//
//  Created by YangYongJie on 16/3/24.
//  Copyright © 2016年 赵安吉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (void)setCellDataWithModel;
@end
