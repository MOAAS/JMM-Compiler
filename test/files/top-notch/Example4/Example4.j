.class public Example4
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 5
new Example4
dup
invokespecial Example4/<init>()V
astore 4
invokestatic ioPlus/requestNumber()I
istore_1
iconst_2
istore_2
iconst_1
istore_3
iload_2
iload_1
if_icmpge LABEL2
LABEL1:
aload 4
iload_1
iload_2
invokevirtual Example4/isDivisibleBy(II)Z
ifeq LABEL3
iconst_0
istore_3
iload_1
istore_2
goto LABEL4
LABEL3:
iinc 2 1
LABEL4:
iload_2
iload_1
if_icmplt LABEL1
LABEL2:
iload_3
invokestatic io2/println(Z)V
return
.end method

.method public isDivisibleBy(II)Z
.limit stack 4
.limit locals 5
iconst_0
istore 4
iload_2
istore_3
iload_3
iload_1
if_icmplt LABEL11
iconst_0
goto LABEL12
LABEL11:
iconst_1
LABEL12:
ifeq LABEL9
iconst_0
goto LABEL10
LABEL9:
iconst_1
LABEL10:
iload_3
iload_1
if_icmplt LABEL17
iconst_0
goto LABEL18
LABEL17:
iconst_1
LABEL18:
ifeq LABEL15
iconst_0
goto LABEL16
LABEL15:
iconst_1
LABEL16:
iload_1
iload_3
if_icmplt LABEL21
iconst_0
goto LABEL22
LABEL21:
iconst_1
LABEL22:
ifeq LABEL19
iconst_0
goto LABEL20
LABEL19:
iconst_1
LABEL20:
iand
ifeq LABEL13
iconst_0
goto LABEL14
LABEL13:
iconst_1
LABEL14:
iand
ifeq LABEL7
iconst_0
goto LABEL8
LABEL7:
iconst_1
LABEL8:
ifeq LABEL6
LABEL5:
iload_3
iload_1
if_icmplt LABEL27
iconst_0
goto LABEL28
LABEL27:
iconst_1
LABEL28:
ifeq LABEL25
iconst_0
goto LABEL26
LABEL25:
iconst_1
LABEL26:
iload_1
iload_3
if_icmplt LABEL31
iconst_0
goto LABEL32
LABEL31:
iconst_1
LABEL32:
ifeq LABEL29
iconst_0
goto LABEL30
LABEL29:
iconst_1
LABEL30:
iand
ifeq LABEL23
iconst_1
istore 4
iload_1
iconst_1
iadd
istore_3
goto LABEL24
LABEL23:
iload_3
iload_2
iadd
istore_3
LABEL24:
iload_3
iload_1
if_icmplt LABEL37
iconst_0
goto LABEL38
LABEL37:
iconst_1
LABEL38:
ifeq LABEL35
iconst_0
goto LABEL36
LABEL35:
iconst_1
LABEL36:
iload_3
iload_1
if_icmplt LABEL43
iconst_0
goto LABEL44
LABEL43:
iconst_1
LABEL44:
ifeq LABEL41
iconst_0
goto LABEL42
LABEL41:
iconst_1
LABEL42:
iload_1
iload_3
if_icmplt LABEL47
iconst_0
goto LABEL48
LABEL47:
iconst_1
LABEL48:
ifeq LABEL45
iconst_0
goto LABEL46
LABEL45:
iconst_1
LABEL46:
iand
ifeq LABEL39
iconst_0
goto LABEL40
LABEL39:
iconst_1
LABEL40:
iand
ifeq LABEL33
iconst_0
goto LABEL34
LABEL33:
iconst_1
LABEL34:
ifne LABEL5
LABEL6:
iload 4
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

