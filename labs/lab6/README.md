## 小记

主要学习了sim文件的写法和一些规范

sim用来测试逻辑电路，通过测试文件中的测试向量，测试预期结果与实际执行结果是否相符

测试向量可以使用黄金法则来生成结果（即使用其他编程语言看看是否符合预期结果的方法）

$display用来输出，用法与printf相似

$readmemb(path, vector)用来将path下的文件以向量形式读入vector

vector是一个数组，verilog中数组命名与c相似(reg [3:0] array_name [0:4])定义了一个有5个元素，每个元素有4b的reg类型数组