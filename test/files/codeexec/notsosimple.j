.class public Simple
.super io
.field field_global I
.field field_simple2 LSimple;
.field field_globalbool Z
.method public static main([Ljava/lang/String;)V
.limit stack 5
.limit locals 7
bipush 30
istore_1
bipush 10
ineg
istore_2
new Simple
dup
invokespecial Simple/<init>()V
astore_3
aload_3
iload_1
iload_2
invokevirtual Simple/add(II)I
istore 4
aload_3
invokevirtual Simple/self()LSimple;
iload_1
iload_2
invokevirtual Simple/func1(II)I
pop
iload 4
invokestatic io/println(I)V
iconst_1
ifeq LABEL7
iconst_0
goto LABEL8
LABEL7:
iconst_1
LABEL8:
ifeq LABEL5
iconst_0
goto LABEL6
LABEL5:
iconst_1
LABEL6:
ifeq LABEL3
iconst_0
goto LABEL4
LABEL3:
iconst_1
LABEL4:
ifeq LABEL1
iconst_0
goto LABEL2
LABEL1:
iconst_1
LABEL2:
iconst_0
ifeq LABEL9
iconst_0
goto LABEL10
LABEL9:
iconst_1
LABEL10:
iand
aload_3
invokevirtual Simple/self()LSimple;
iconst_3
bipush 21
invokevirtual Simple/add(II)I
bipush 24
if_icmplt LABEL13
iconst_0
goto LABEL14
LABEL13:
iconst_1
LABEL14:
ifeq LABEL11
iconst_0
goto LABEL12
LABEL11:
iconst_1
LABEL12:
iand
iconst_0
ifeq LABEL19
iconst_0
goto LABEL20
LABEL19:
iconst_1
LABEL20:
ifeq LABEL17
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
iand
istore 5
bipush 50
newarray int
astore 6
aload 6
aload_3
iload_1
iload_2
invokevirtual Simple/add(II)I
iconst_2
iadd
bipush 20
iastore
aload 6
aload_3
iload_1
iload_2
invokevirtual Simple/add(II)I
iconst_5
iadd
bipush 50
iastore
iload 5
invokestatic io/println(Z)V
aload 6
aload_3
iload_1
iload_2
invokevirtual Simple/add(II)I
iconst_4
bipush 1
ishr
iadd
iaload
invokestatic io/println(I)V
aload 6
bipush 25
iaload
invokestatic io/println(I)V
aload 6
bipush 25
iaload
bipush 51
if_icmplt LABEL21
iconst_0
goto LABEL22
LABEL21:
iconst_1
LABEL22:
invokestatic io/println(Z)V
aload 6
bipush 25
iaload
bipush 50
if_icmplt LABEL23
iconst_0
goto LABEL24
LABEL23:
iconst_1
LABEL24:
invokestatic io/println(Z)V
aload 6
arraylength
iconst_3
bipush 1
ishr
iadd
invokestatic Simple/println(I)V
aload_3
invokevirtual Simple/return4174()I
invokestatic Simple/println(I)V
aload_3
aload_3
invokevirtual Simple/return4174()I
invokevirtual Simple/print(I)I
pop
aload_3
aload_3
bipush 20
invokevirtual Simple/newArray(I)[I
arraylength
invokevirtual Simple/print(I)I
pop
aload_3
aload_3
bipush 20
iconst_2
bipush 10
invokevirtual Simple/newArrayWithElementSet(III)[I
iconst_2
iaload
invokevirtual Simple/print(I)I
pop
return
.end method

.method public self()LSimple;
.limit stack 1
.limit locals 1
aload_0
areturn
.end method

.method public print(I)I
.limit stack 1
.limit locals 2
iload_1
invokestatic io/println(I)V
iconst_0
ireturn
.end method

.method public newArray(I)[I
.limit stack 1
.limit locals 2
iload_1
newarray int
areturn
.end method

.method public newArrayWithElementSet(III)[I
.limit stack 3
.limit locals 5
aload_0
iload_1
invokevirtual Simple/newArray(I)[I
astore 4
aload 4
iload_2
iload_3
iastore
aload 4
areturn
.end method

.method public add(II)I
.limit stack 2
.limit locals 3
iload_1
iload_2
iadd
ireturn
.end method

.method public func1(II)I
.limit stack 4
.limit locals 3
aload_0
iload_1
iload_2
isub
putfield Simple/field_global I
aload_0
new Simple
dup
invokespecial Simple/<init>()V
putfield Simple/field_simple2 LSimple;
aload_0
iconst_1
iconst_2
if_icmplt LABEL25
iconst_0
goto LABEL26
LABEL25:
iconst_1
LABEL26:
iconst_2
iconst_3
if_icmplt LABEL27
iconst_0
goto LABEL28
LABEL27:
iconst_1
LABEL28:
iand
iconst_2
bipush 2
ishl
iconst_1
iadd
bipush 9
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
putfield Simple/field_globalbool Z
aload_0
invokevirtual Simple/func2()I
pop
iconst_0
ireturn
.end method

.method public func2()I
.limit stack 3
.limit locals 1
sipush 12000
invokestatic io/println(I)V
aload_0
getfield Simple/field_global I
invokestatic io/println(I)V
aload_0
getfield Simple/field_simple2 LSimple;
bipush 10
bipush 20
invokevirtual Simple/add(II)I
invokestatic io/println(I)V
sipush 12000
invokestatic io/println(I)V
aload_0
getfield Simple/field_globalbool Z
invokestatic io/println(Z)V
iconst_0
ireturn
.end method

.method public return4174()I
.limit stack 5
.limit locals 1
sipush 455
bipush 20
bipush 10
bipush 20
imul
bipush 42
iconst_3
idiv
isub
imul
iadd
iconst_1
isub
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual io/<init>()V
  return
.end method

