# AYBubbleView

仿qq的可拖拽未读气泡

# 介绍
模仿qq未读消息的气泡拖拽效果

效果图如下

![效果图](http://7xrofo.com1.z0.glb.clouddn.com/bubbleView.gif)

# 使用
## 初始化
```objc
self.bubbleView = [[AYBubbleView alloc] initWithCenterPoint:self.view.center bubleRadius:15 addToSuperView:self.view];
self.bubbleView.decayCoefficent = .2;
self.bubbleView.unReadLabel.text = @"1";
self.bubbleView.bubbleColor = [UIColor redColor];
__weak typeof(self) weakSelf = self;
self.bubbleView.cleanMessageBlock = ^(BOOL isClean) {
    if (isClean) {
        weakSelf.messageSteper.value = 0;
    } else {
//            do other logical operation
    }
};

```
初始化的时候配置bubble的中心点坐标、半径和父视图。

**decayCoefficient**：衰减系数，0~1，值越大，可拉伸的距离越大。

**unreadLabel**：中间显示的未读数，可自行配置font，color等。

**bubbleColor**：气泡的颜色

**cleanMessageBlock**：清除消息的时候进行回调操作。
## 显示和隐藏
当需要显示气泡的时候调用下面的方法

```objc
[self.bubbleView showBubbleView];
```
当需要隐藏气泡的时候调用下面的方法

```objc
[self.bubbleView hidenBubbleView];
```
