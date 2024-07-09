## 关于lab5

ALU的实现很好实现，我是按照实验指导书的方法设计的ALU，也可以直接在ALU模块直接使用case语句来设计该ALU



主要的不足在于，不会看综合和实现的报告，以及时序分析的报告



## part3

| 问题                                                         | 答案       |
| ------------------------------------------------------------ | ---------- |
| Number of LUTs                                               | 95         |
| Number of bonded IOBs                                        | 100        |
| Which pin of the FPGA is the output<br />'zero'connected?(pin name) |            |
| Where does the longest path start from                       | aluop[1]   |
| Where dose the longest path end                              | result[26] |
| How long is the longest path                                 | 16.790ns   |
| How much of the longest path is routiong                     | 67.723%    |
| How many levels of logic is in the longest path              | 11         |

以上数据根据实现方式不同而不同，很多数据我也不太会找（需要补充相关知识）