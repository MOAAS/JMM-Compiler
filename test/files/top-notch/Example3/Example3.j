.class public Example3
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 3
new Example3
dup
invokespecial Example3/<init>()V
astore_1
aload_1
invokestatic ioPlus/requestNumber()I
invokevirtual Example3/createArray(I)[I
astore_2
aload_2
invokestatic io/printArray([I)V
aload_1
aload_2
invokevirtual Example3/sortList([I)[I
astore_2
aload_2
invokestatic io/printArray([I)V
return
.end method

.method public sortList([I)[I
.limit stack 5
.limit locals 6
iconst_0
istore_2
iload_2
aload_1
arraylength
iconst_1
isub
if_icmpge LABEL2
LABEL1:
iconst_1
istore 5
iconst_0
istore_3
iload_3
aload_1
arraylength
iconst_1
isub
if_icmpge LABEL4
LABEL3:
aload_1
iload_3
iconst_1
iadd
iaload
aload_1
iload_3
iaload
if_icmpge LABEL5
iconst_0
istore 5
aload_1
iload_3
iaload
istore 4
aload_1
iload_3
aload_1
iload_3
iconst_1
iadd
iaload
iastore
aload_1
iload_3
iconst_1
iadd
iload 4
iastore
goto LABEL6
LABEL5:
LABEL6:
iinc 3 1
iload_3
aload_1
arraylength
iconst_1
isub
if_icmplt LABEL3
LABEL4:
iinc 2 1
iload 5
ifeq LABEL7
aload_1
arraylength
istore_2
goto LABEL8
LABEL7:
LABEL8:
iload_2
aload_1
arraylength
iconst_1
isub
if_icmplt LABEL1
LABEL2:
aload_1
areturn
.end method

.method public createArray(I)[I
.limit stack 2
.limit locals 2
aload_0
iload_1
newarray int
invokevirtual Example3/fillArray([I)[I
areturn
.end method

.method public fillArray([I)[I
.limit stack 3
.limit locals 3
iconst_0
istore_2
iload_2
aload_1
arraylength
if_icmpge LABEL10
LABEL9:
aload_1
iload_2
invokestatic ioPlus/requestNumber()I
iastore
iinc 2 1
iload_2
aload_1
arraylength
if_icmplt LABEL9
LABEL10:
aload_1
areturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

