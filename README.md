# ZKPopBaseController
可以在一个VC中添加一个窗口大小的VC，并在弹出的VC中跳转到下级界面。重写了Push和Pop的动画  
适用于一系列窗口式界面多次跳转的情况  
    ![](https://github.com/HelloiWorld/ZKPopBaseController/blob/master/ZKPopBaseController/0C14A91F-73F6-4680-8207-63E8FEF916F2.png)
  
## 使用方法  
    #import "PopBottomView.h"  
    #import "FirstViewController.h"  
    
    //弹出界面,所有弹出的界面需要继承PopBaseController
    PopBottomView *pop = [[PopBottomView alloc] initWithFrame:PopWindowTypeB type:2];
    [self.view addSubview:pop];
    FirstViewController *vc = [[FirstViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    [pop addSubview:navi.view];
    [self addChildViewController:navi];

VC里推荐使用xib的方式加载View，不要使用ViewController.xib，应使用XXXView.xib


### 后续界面直接按如下方法跳转
    #import "SecondViewController.h"
    
    SecondViewController *vc = [[SecondViewController alloc] init]; 
    [self pushVC:vc];  
