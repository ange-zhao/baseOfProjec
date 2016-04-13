//
//  ModifyPasswordViewController.h
//  TelecomTravel
//
//  Created by MT on 14-5-11.
//
//

#import "BaseViewController.h"

typedef enum {
    CHANGE_PASSWORD,
    REGISTER,
}ControllerType;

@interface ModifyPasswordViewController : BaseViewController

@property (nonatomic) ControllerType cType;

@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *verificationTF;

@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UIView *saveBtn;




@end
