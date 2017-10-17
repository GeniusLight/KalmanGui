KalmanGui
===========================
    kalman滤波的GUI。
    针对为线性变不变系统，线性时变，非线性时不变，非线性时变系统。
    采用kF,UKF方法，支持固定的采样时间，使用(sat)输入表示
    噪声为不相关的高斯白噪声。

****
## 目录
* [版本说明](#版本说明)
* [主界面](#主界面)
* [参数初始化](#参数初始化)
* [待完善功能](#待完善功能)
* [参考](#参考)

### 版本说明
|版本号|具体功能|
|---|---|
V1.0|包含ukf和kf滤波方法，支持txt配置文件的导入和导出|

### 主界面
-----------
主界面如下：
![mian_ui](https://github.com/GeniusLight/KalmanGui/blob/master/img/main_ui.PNG "主界面")

|#|功能模块|具体介绍|
|---|----|----
1|菜单栏设计|文件的读取和导出、帮助文档
1.1|导入数据--观测数据|导入通过格式转化的观测数据[MxN]其中M表示数据测量条数，N表示测量数据维度,文件格式为txt
1.1|导入数据--真实数据|文件格式同上，说明真实数据为状态变量的真实数据(以上例子可参加test文件下测试案例)
1.2|导出数据--滤波后数据|导出滤波后状态变量值，文件格式为txt
1.2|导出数据--分析结果|导出分析结果，文件格式为txt
1.3|使用帮助--项目说明|跳转到github
2|操作界面|主要的操作功能
2.1|操作--初始化|跳转到初始化参数界面，界面具体内容参见下文
2.2|操作--滤波|使用适当的方式滤波
2.3|操作--波形显示|显示波形，具体显示方式和显示维度可选
2.4|操作--选择显示方式|选择波形单独显示或者比较显示
2.5|操作--选择显示维度|根据数据的维度，可以分别显示


__建议操作顺序：初始化参数-->导入数据-->滤波--->波形显示-->导出数据__

###  参数初始化
------
参数初始化界面如下：
![init_param](https://github.com/GeniusLight/KalmanGui/blob/master/img/init_param.PNG "主界面")

|#|功能模块|具体介绍|
|---|----|----
1|菜单栏设计|配置文件的读取和导出
1.1|导入数据--配置文件|导入参数配置文件，只支持txt格式
1.2|导出数据--配置文件|导出参数配置文件，只支持txt格式
2|操作界面|主要的初始化操作
2.1|输入参数维度|输入参数的维度(必要)，输入采样时间ms(只有需要使用时才需要输入)，使用用`sat`表示
2.2|初始化参数|以下输入时只需替换初始矩阵(零矩阵)相应位置值即可
2.3|参数--状态变量x|输入参数，确保维度正确
2.4|参数--初始P|P需要为正定矩阵，并确保维度正确
2.5|参数--初始Q|Q需要为对称矩阵，并确保维度正确
2.6|参数--初始R|R需要为对称矩阵，并确保维度正确
3|初始化模型|含`矩阵形式`和`方程形式`，并用sat表示时间
3.1|矩阵形式|状态转移矩阵只需替换初始矩阵(零矩阵)相应位置值即可
3.2|方程形式|输入函数的句柄，确保一行输入，即不含换行

__建议操作顺序：输入参数维度-->输入参数-->输入模型__

###  待完善功能
------
* 滤波后结果分析
- 增加更多的滤波方法并且其效果比较
* 界面美化

### 参考
------
1. Python的kalman滤波包：[filterpy](https://github.com/rlabbe/filterpy "悬停显示")

使用此第三方包验证滤波方法准确性
