.class public Ropt1
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
new Ropt1
dup
invokespecial Ropt1/<init>()V
iconst_1
invokevirtual Ropt1/soManyRegisters(Z)I
invokestatic io/println(I)V
return
.end method

.method public soManyRegisters(Z)I
.limit stack 1
.limit locals 2
iconst_0
istore_0
iload_0
istore_0
iload_0
istore_0
iload_0
istore_0
iload_0
ireturn
.end method

.method public anotherOne()I
.limit stack 2
.limit locals 3
iconst_2
istore_2
iconst_3
istore_1
iconst_5
istore_0
iload_2
iload_1
imul
istore_1
iload_2
iload_2
imul
iload_0
iadd
istore_0
iload_1
iload_0
iadd
istore_0
iconst_0
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

