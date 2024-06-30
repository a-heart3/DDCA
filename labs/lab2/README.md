## 关于lab2

* 实验文档在pdf目录下

* logisim电路图在solutions目录下

* 在vivado中导入`vivado/lab2`目录下的`lab2.xpr`可以看到项目的所有实现文件

  1. 所有verilog文件在vsrc目录下
  2. 所有的约束文件在constr目录下
  3. 仿真文件在sim目录下（有些忘记改路径了）， 不过我的仿真文件写的不好
  4. 最后的bit文件在bitstream/impl_1文件下

* 所有模块实现集成到了top模块中，最后烧录也是以top模块烧录的

* 管脚说明

  ```
  1. 开关0-3是加法器的输入a，同时也是4-1选择器的输入a
  2. 开关4-7是加法器的输入b
  3. led0-4是加法器的输出结果
  4. 开关8-9是译码器的输入
  5. led5-8是译码器的输出结果
  6. 开关10-11是4-1选择器的输入s
  7. led9是4-1选择器的输出
  ```

  



## 题目思路

按照真值表-->真值表达式-->利用公式化简-->logisim验证电路搭建-->verilog描述硬件逻辑顺序，思路部分只写前三步，logisim, verilog 部分可以去对应目录下查看



### 4位全加器

1. 首先设计一位全加器

   | ci   | b    | a    | co   | s    |
   | ---- | ---- | ---- | ---- | ---- |
   | 0    | 0    | 0    | 0    | 0    |
   | 0    | 0    | 1    | 0    | 1    |
   | 0    | 1    | 0    | 0    | 1    |
   | 0    | 1    | 1    | 1    | 0    |
   | 1    | 0    | 0    | 0    | 1    |
   | 1    | 0    | 1    | 1    | 0    |
   | 1    | 1    | 0    | 1    | 0    |
   | 1    | 1    | 1    | 1    | 1    |

   

   逻辑表达式：
   $$
   co = \overline{ci}ba + ci\overline{b}a + cib\overline{a} + ciba \\
   s = \overline{ci}*\overline{b}a + \overline{ci}b\overline{a} + ci\overline{b}*\overline{a} + ciba
   $$
   化简：
   $$
   co = ba(\overline{ci} + ci) + ci(\overline{b}a + b\overline{a})\\
   =ba + ci(a\bigoplus b)\\
   s = \overline{b}(\overline{ci}a + ci\overline{a}) + b(\overline{ci}\overline{a} + cia)\\
   =\overline{b}(ci\bigoplus a) + b\overline{ci\bigoplus a}\\
   =b\bigoplus a\bigoplus ci
   $$

2. 然后设计四位全加器

   只需要按照实验手册中的图，将四个一位全加器连接即可，第一个全加器的ci连接常数0



### 译码器

1. 真值表

   | A    | B    | O3   | O2   | O1   | O    |
   | ---- | ---- | ---- | ---- | ---- | ---- |
   | 0    | 0    | 0    | 0    | 0    | 1    |
   | 0    | 1    | 0    | 0    | 1    | 0    |
   | 1    | 0    | 0    | 1    | 0    | 0    |
   | 1    | 1    | 1    | 0    | 0    | 0    |



2. 逻辑表达式
   $$
   O = \overline{A}*\overline{B}\\
   O1 = \overline{A}B\\
   O2 = A\overline{B}\\
   O3 = AB
   $$



### 4-1选择器

1. 首先设计2-1选择器

   1. 真值表

      | a    | b    | s    | o    |
      | ---- | ---- | ---- | ---- |
      | 0    | 0    | 0    | 0    |
      | 0    | 1    | 0    | 0    |
      | 1    | 0    | 0    | 1    |
      | 1    | 1    | 0    | 1    |
      | 0    | 0    | 1    | 0    |
      | 0    | 1    | 1    | 1    |
      | 1    | 0    | 1    | 0    |
      | 1    | 1    | 1    | 1    |

   2. 逻辑表达式与化简
      $$
      o = a\overline{b}*\overline{s} + ab\overline{s} + \overline{a}bs + abs\\
      =\overline{s}a(b + \overline{b}) + sb(\overline{a} + a)\\
      =\overline{s}a + sb
      $$

2. 设计4-1选择器（这里按照题目要求，使用3个2-1选择器连接），下面说明思路

   1. 高位的s控制选择4位中的高2位模块m1还是低两位模块m2
   2. 低位的s控制选择m1或者m2中的高位还是低位





## vivado使用的一些经验,问题与解决方法

1. Vscode编写verilog 时遇见`Error: Unkown module type`:在verilog已经定义的情况下，需要打开Verilog-HDL插件的设置，在`Verilog>Linting>Iverilog:Arguments`一栏中添加`-i`命令参数。

   原因:这是因为`编译`是以单个文件为单位编译的，而多个文件编译需要`链接`。Verilog-HDL 插件无法智能推断出多个文件之间的依赖关系。为此，我们可以使用命令参数抑制此类错误，即 iverilog 编译器不再检查模块实例化的时候引用的模块是否已经定义。

   前提是使用iverilog编译器

2. 板子物理连接正常（灯是亮的，但是vivado无法连接到的修复方法）

   * 拔掉板子

   * 然后找到vivado安装目录

     如`~/vivado`

   * 在

     `~/vivado/Vivado/2024.1/data/xicom/cable_drivers/lin64/install_script/install`目录下运行

     `sudo ./install_drivers`即可

3. 对于`Bank IO standard Vcc:confilicting Vcc voltage in bank. For example`的问题：同一个bank的电压，都要是相同的

   因此，设计端口的时候要注意，对于端口的电压的约束需要相同

   故在约束文件添加

   `set_property IOSTANDARD LVCMOS33 [get_ports {ports}]`

4. 如果想对不同的verilog文件增加约束，则可以创建多个约束文件夹，在每个文件夹中创建需要的约束，然后对需要的文件夹激活即可(右键文件夹，`make active`)

5. constr文件在项目中一定会用到，且是按照顺序检测的，所以写大项目时，可以分文件约束

6. 注意在constr文件中，编写get_port参数时，参数以空格分割，不以`,`分割