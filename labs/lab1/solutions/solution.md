# solutions of lab1

以下题解均为自己写的

## part1

没有什么要特别写出来的，用异或门和与门即可



## part2

| A    | B    | O1   | O2   | O3   |
| ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 1    | 0    |
| 0    | 1    | 0    | 0    | 1    |
| 1    | 0    | 1    | 0    | 0    |
| 1    | 1    | 0    | 1    | 0    |

根据真值表写出三个输出的表达式
$$
O1 = A\overline{B}\\O2 = \overline{A \oplus B} = \overline{A}*\overline{B} + AB\\O3 = \overline{A}B
$$
然后根据三个逻辑表达式画出电路图即可



### part3

需要使用德摩根律
$$
O1 = A\overline{B} + A\overline{A} = \overline{\overline{A\overline{B}+A\overline{A}}} = \overline{\overline{A\overline{B}}\star\overline{A\overline{A}}}\\
O2 = \overline{\overline{\overline{A}*\overline{B}+AB}} = \overline{\overline{\overline{A}*\overline{B}}*\overline{AB}}\\
O3 = \overline{A}B + A\overline{A} = \overline{\overline{\overline{A}B+A\overline{A}}} = \overline{\overline{\overline{A}B}*\overline{A\overline{A}}}
$$
上述化简十分麻烦，也希望有更好的解决方法