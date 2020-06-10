.class public Simple
.super java/lang/Object
.field field_global I
.field field_simple2 LSimple;
.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 5
bipush 30
istore_1
bipush 10
ineg
istore_2
iinc 1 30
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
iload_1
iload_2
invokevirtual Simple/func1(II)I
pop
iload 4
invokestatic io/println(I)V
iconst_1
invokestatic io/println(Z)V
return
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
.limit stack 3
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
iconst_0
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

