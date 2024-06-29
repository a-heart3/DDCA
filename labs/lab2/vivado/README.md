遇到的问题：

* 如果板子和电脑连接后，物理连接正常（电源，led显示正常），但是vivado无法检测到板子信息，则可以尝试下述方法解决：

  1. 找到vivado的安装目录

  2. 找到如下路径

     `~/vivado/Vivado/2024.1/data/xicom/cable_drivers/lin64/install_script/install`

  3. 运行`sudo ./install_drivers`

  4. 以上步骤需要先拔掉板子连接线，然后执行完毕后再插上