## 关于这次lab

实验的文档，实现，和电路图分别在pdf, vivado, solutions中



## lab4 manual

1. 实现电路（logisim）

   1. 首先画出状态转化图

   2. 根据状态转化图写出状态转化表（S0代表初始状态， S1代表错误状态， L1-3代表左灯的三个状态， R1-3代表右灯的三个状态）

      | present | left | right | reset | next |
      | ------- | ---- | ----- | ----- | ---- |
      | S0      | 1    | 0     | 0     | L1   |
      | S0      | 0    | 1     | 0     | R1   |
      | S0      | 0    | 0     | 0     | S0   |
      | S0      | 1    | 1     | 0     | S1   |
      | S0      | x    | x     | 1     | S0   |
      | L1      | x    | 0     | 0     | L2   |
      | L1      | x    | 1     | 0     | S1   |
      | L1      | x    | x     | 1     | S0   |
      | L2      | x    | 0     | 0     | L3   |
      | L2      | x    | 1     | 0     | S1   |
      | L2      | x    | x     | 1     | S0   |
      | L3      | x    | 0     | 0     | S0   |
      | L3      | x    | 1     | 0     | S1   |
      | L3      | x    | x     | 1     | S0   |
      | S1      | x    | x     | x     | S0   |

      表中只写了左灯的状态转换表，右灯与左灯的状态转换表逻辑上相同，x的表示任意值

   3. 写出输出转换表

      | present | LC   | LB   | LA   | RA   | RB   | RC   |
      | ------- | ---- | ---- | ---- | ---- | ---- | ---- |
      | S0      | 0    | 0    | 0    | 0    | 0    | 0    |
      | L1      | 0    | 0    | 1    | 0    | 0    | 0    |
      | L2      | 0    | 1    | 1    | 0    | 0    | 0    |
      | L3      | 1    | 1    | 1    | 0    | 0    | 0    |
      | R1      | 0    | 0    | 0    | 1    | 0    | 0    |
      | R2      | 0    | 0    | 0    | 1    | 1    | 0    |
      | R3      | 0    | 0    | 0    | 1    | 1    | 1    |
      | S1      | 1    | 1    | 1    | 1    | 1    | 1    |

   4. 为状态编码

      * 可以选择二进制编码（位数少）或者独热码 （逻辑简单）的方式进行编码

   5. 根据状态编码写出状态转换表和输出转换表的二进制编码形式

   6. 根据二进制编码写出逻辑表达式，并化简

   7. 连接电路

2. 在verilog实现电路时，最主要的问题是将clk_div产生的clk_en信号当作了寄存器的时钟信号来实现电路，这样导致的后果是，在basys3开发板上的实现结果与预期的结果不符合（可能在其他开发板上表现正常， 比如NVBoard开发板）



## lab4 report

1. 实现信号灯的亮度:report中写的非常清除的实现，比如3个周期灯亮，一个周期灯灭，则灯的亮度为75%

2. 实现逻辑

   1. 与lab4 manual的实现逻辑相似，但是左右各加了两个状态，

      | 状态 | 表现                                                  |
      | ---- | ----------------------------------------------------- |
      | S0   | 灯全灭                                                |
      | L1   | LA 亮度 50%                                           |
      | L2   | LA 亮度 75%<br />LB 亮度 50%                          |
      | L3   | LA 亮度 100%<br />LB亮度   75%<br />LC亮度   50%      |
      | L4   | LA 亮度  100%<br />LB 亮度   100%<br />LC 亮度    75% |
      | L5   | LA 亮度  100%<br />LB亮度   100%<br />LC亮度    100%  |
      | S1   | 灯全亮                                                |

      应该与report要求不符，不如report实现结果中的好看，右灯与左灯相似

   2. 做了一个灯的控制模块，控制灯显示不同的亮度

      | 输入 | 亮度 |
      | ---- | ---- |
      | 00   | 灭   |
      | 01   | 50%  |
      | 10   | 75%  |
      | 11   | 100% |

   3. 修改输出逻辑，每个灯有两位的输出，用来连接灯的控制模块，选择灯的亮度，其余模块的实现和连接与manual中的没有差别

   4. 在report中，下一个状态模块的组合逻辑电路实现方法采用了case和if_else相结合，区别于manual的实现，个人认为是一种可读性更高，更简洁的写法。

      思路：

      1. 首先判断rst信号一旦为高电平，则必重置状态
      2. 否则，判断left和right是否同时为1, 若是， 转为S1状态
      3. 否则， 根据状态和输入值判断转向哪个状态。

      顺序乱可能导致最后实现错误

      

      

      ## vivado使用的问题和想法

      1. synth 8-7080 Parallel synthesis criteria is not met:无影响，程序太小无法从并发综合中获益（This message relates to a criteria  that evaluates if this run would benefit to use a multithreaded  synthesis. As a rule of thumb, If the design is not big enough, it would not benefit from running in parallel）
      2. inferred latch for signal:if-else/case没有匹配完，没有影响;或者某个信号只在一种条件下赋值，在其他条件下没有被赋值
      3. 电路中的所有时序逻辑电路，clk，rst应该保持一致（与主机），然后利用使能信号，控制时序逻辑电路的时间差异。
      4. system verilog 可以使用typedef语法自定义变量，很适合用enum定义常数，report中的实现方法增加了代码的可读性。

      