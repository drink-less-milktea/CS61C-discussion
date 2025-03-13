#set par(justify: true)
#set page(numbering: "1/1")
#set text(font: "LXGW WenKai Mono", size: 12pt)
#set heading(numbering: "1.1")

#text(align(center)[*Solution of Discussion 05*], size: 17pt)
#text(align(center)[DrinkLessMilkTea \ 2025-3-12 ])

= Pre-Check
==
True, 编译器会将源语言转换成汇编代码, 其中汇编代码可以包含伪指令 
==
False, 汇编的主要工作是将汇编代码转换成 obj 文件, 同时生成每个文件的重定位表
==
False, obj 文件中有些绝对地址可能会被 Linker 修改, 由于需要多个文件链接
==
False, 如果需要跳转到寄存器相对地址, 则在运行时才能确定
= CALL
==
存储程序是指将程序作为数据来对待, 可以保存在计算机的内存中, 他让我们在改变程序时不必修改计算机的电路结构, 只需要进行编程就可以产生程序, 极大的方便了程序员
==
3 次, 第一次需要将所有伪指令转换成正常指令, 第二次需要确定所有 label 的位置, 第三次填写需要的 label 地址和生成 obj 文件以及重定位表
==
- Header: 程序的各种信息
- Text: 代码段
- Data: 程序需要使用的数据空间
- Relocation Table: 重定位表, 需要 Linker 进行重定位的条目
- Symbol Table: 程序中外部可见的符号表
- Debugging Information: 调试信息
==
相对寻址在 Assembler 阶段完成, 绝对寻址在 Linker 阶段完成

= Assembling RISC-V
== 
第五行和第六行, 指令 ```asm li t1, 4``` 需要被转换成 ```asm addi t1, t1, 4```, 指令 ```asm la t0, array```s 需要拆成指令 ```asm auipc``` 和 ```asm addi```

第七行和十四十五行, 指令 ```asm mv``` 需要变成 ```asm addi```, 指令 ```asm j``` 需要变成 ```asm jal x0```
==
loop 会在第一次扫描被填充, end 会在第二次扫描填充
==
sum
==
array, print_int

= RISC-V Addressing
==
`branch` 有 12 位立即数的寻址空间, 单位是半字, 也就是 2 字节, 总共的寻址范围是 #sym.plus.minus 4KB
==
`jump` 有 20 位立即数的寻址空间, 单位是半字, 也就是 2 字节, 总共的寻址范围是 #sym.plus.minus 1MB
==
#table(columns: 2, align: center)[命令][十六进制表示][add t1, t2, t0][0 5 7 0 6 0x33][jal ra foo][0 0x14 0 0 1 0x6F][bne t1, zero, loop][1 0x3F 0 6 1 0xC 1 0x63]

ra = 0x002cff08