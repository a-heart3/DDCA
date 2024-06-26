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



## part3

需要使用德摩根律
$$
O1 = A\overline{B} + A\overline{A} = \overline{\overline{A\overline{B}+A\overline{A}}} = \overline{\overline{A\overline{B}}\star\overline{A\overline{A}}}\\
O2 = \overline{\overline{\overline{A}*\overline{B}+AB}} = \overline{\overline{\overline{A}*\overline{B}}*\overline{AB}}\\
O3 = \overline{A}B + A\overline{A} = \overline{\overline{\overline{A}B+A\overline{A}}} = \overline{\overline{\overline{A}B}*\overline{A\overline{A}}}
$$
上述化简十分麻烦，也希望有更好的解决方法



## Exercise1

| Comparator Width | 2-input XNOR gates | 2-input AND gates | Logic depth |
| ---------------- | ------------------ | ----------------- | ----------- |
| 8 bits           | 8                  | 7                 | 4           |
| 16bits           | 16                 | 15                | 5           |
| 32bits           | 32                 | 31                | 6           |
| 64bits           | 64                 | 63                | 7           |

1. The number of 2-input XNOR gates

   `N`

2. The number of 2-input AND gates

   `N/2 + ...... + 2 + 1 = N - 1`用到等比数列求和

3. The logic depth

   $ log{_2}{N} + 1$，加1指的是最开始的XOR门



## Exercise 2

比较思路：

首先比较AB的高位，

1. A的高位大于B的高位，则O1输出1,其他为0
2. A的高位小于B的高位，则O3输出1,其他为0
3. A的高位等于B的高位

若A的高位和B的高位相等，比较下一位

1. A的位大于B的位，O1输出1,其他为0

2. A的位小于B的位，O3输出1,其他为0

3. A的位等于B的位，O2输出1,其他为0

综上：

1. O1输出1时：（两种情况为或的关系）
   * A的高位大于B的高位
   * A的高位等于B的高位且A的低位大于B的低位
2. O2输出1时：
   * A的高位等于B的高位且A的低位等于B的低位
3. O3输出1时：
   * A的高位小于B的高位
   * A的高位等于B的高位且A的低位小于B的低位



也可以使用真值表写出SOP的形式再画电路，但是题目要求使用之前设计好的比较器来实现



## Exercise 3

在我的设计中，logic depth 是3



