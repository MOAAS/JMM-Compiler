.class public Example2
.super io2
.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
new Example2
dup
invokespecial Example2/<init>()V
astore_1
aload_1
sipush 1500
invokevirtual Example2/println(I)V
aload_1
aload_1
invokestatic ioPlus/requestNumber()I
invokestatic ioPlus/requestNumber()I
invokevirtual Example2/calculate2DOctant(II)I
invokevirtual Example2/println(I)V
aload_1
aload_1
invokestatic ioPlus/requestNumber()I
invokevirtual Example2/calculateFactorial(I)I
invokevirtual Example2/println(I)V
aload_1
aload_1
invokestatic ioPlus/requestNumber()I
invokevirtual Example2/createArray(I)[I
invokevirtual Example2/printArray([I)I
pop
return
.end method

.method public calculate2DOctant(II)I
.limit stack 3
.limit locals 4
iload_1
ifge LABEL1
iload_2
ifge LABEL3
iload_2
iload_1
if_icmpge LABEL5
bipush 6
istore_3
goto LABEL6
LABEL5:
iconst_5
istore_3
LABEL6:
goto LABEL4
LABEL3:
iload_2
iconst_0
iload_1
isub
if_icmpge LABEL7
iconst_4
istore_3
goto LABEL8
LABEL7:
iconst_3
istore_3
LABEL8:
LABEL4:
goto LABEL2
LABEL1:
iload_2
ifge LABEL9
iload_2
iconst_0
iload_1
isub
if_icmpge LABEL11
bipush 7
istore_3
goto LABEL12
LABEL11:
bipush 8
istore_3
LABEL12:
goto LABEL10
LABEL9:
iload_2
iload_1
if_icmpge LABEL13
iconst_1
istore_3
goto LABEL14
LABEL13:
iconst_2
istore_3
LABEL14:
LABEL10:
LABEL2:
iload_3
invokestatic io/println(I)V
iload_3
ireturn
.end method

.method public calculateFactorial(I)I
.limit stack 2
.limit locals 3
iconst_1
istore_2
iconst_0
iload_1
if_icmpge LABEL16
LABEL15:
iload_2
iload_1
imul
istore_2
iload_1
iconst_1
isub
istore_1
iconst_0
iload_1
if_icmplt LABEL15
LABEL16:
iload_2
ireturn
.end method

.method public createArray(I)[I
.limit stack 2
.limit locals 2
aload_0
iload_1
newarray int
invokevirtual Example2/fillArray([I)[I
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
if_icmpge LABEL18
LABEL17:
aload_1
iload_2
invokestatic ioPlus/requestNumber()I
iastore
iinc 2 1
iload_2
aload_1
arraylength
if_icmplt LABEL17
LABEL18:
aload_1
areturn
.end method

.method public printArray([I)I
.limit stack 2
.limit locals 3
iconst_0
istore_2
iload_2
aload_1
arraylength
if_icmpge LABEL20
LABEL19:
aload_1
iload_2
iaload
invokestatic io/println(I)V
iinc 2 1
iload_2
aload_1
arraylength
if_icmplt LABEL19
LABEL20:
iconst_0
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual io2/<init>()V
  return
.end method

