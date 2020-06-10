.class public TestStack
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 7
iconst_2
istore_2
iconst_5
istore_0
iconst_3
istore_1
bipush 7
istore_1
iconst_1
istore_0
iconst_1
istore_0
iconst_2
iload_1
if_icmpge LABEL1
iconst_2
istore_2
iconst_5
istore_0
goto LABEL2
LABEL1:
iconst_2
istore_2
iconst_3
istore_0
LABEL2:
iconst_2
iload_0
iadd
istore_1
iconst_1
istore_2
iconst_2
istore_1
iload_2
iconst_2
if_icmpge LABEL4
LABEL3:
iconst_3
istore_2
iload_2
iconst_2
if_icmplt LABEL3
LABEL4:
return
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

