# Data_Processing_of_WBAN_Human_Body_Center_Communication_Equipment

#### 项目介绍
&#160; &#160; &#160; &#160; 无线体域网人体中心通信设备数据处理源代码。

#### 文件结构

* Battery_and_Channel_Power_Measurement_System.m
    * Data_Process.m
    * Data_Output.m
    * AB_Per_RSSI.m

#### 日志

* 首次更新 `2021.4.15`
    * 读取设备A、B保存的二进制数据文件，去掉设备校验位，组合成原始数据；
    * 计算出原始数据对应的实际值；
    * 实际值保存至Excel并以图形化显示。