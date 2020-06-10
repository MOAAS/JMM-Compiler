.class public Gamer
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
new Gamer
dup
invokespecial Gamer/<init>()V
iconst_1
invokevirtual Gamer/soManyRegisters(Z)I
invokestatic io/println(I)V
return
.end method

.method public soManyRegisters(Z)I
.limit stack 1
.limit locals 2
iconst_0
istore_1
iload_1
istore_1
iload_1
istore_1
iload_1
istore_1
iload_1
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

