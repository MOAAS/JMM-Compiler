.class public SmallOptimizations
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 3
new SmallOptimizations
dup
invokespecial SmallOptimizations/<init>()V
astore_2
aload_2
iconst_1
invokevirtual SmallOptimizations/double(I)I
istore_1
aload_2
bipush 10
invokevirtual SmallOptimizations/negate(I)I
invokestatic io/println(I)V
aload_2
bipush 10
invokevirtual SmallOptimizations/double(I)I
invokestatic io/println(I)V
iload_1
bipush 10
imul
invokestatic io/println(I)V
iload_1
bipush 2
ishl
invokestatic io/println(I)V
iload_1
bipush 4
ishl
iconst_1
iadd
invokestatic io/println(I)V
aload_2
bipush 30
invokevirtual SmallOptimizations/double(I)I
istore_1
iload_1
bipush 5
ishr
iload_1
bipush 6
ishl
isub
invokestatic io/println(I)V
return
.end method

.method public negate(I)I
.limit stack 1
.limit locals 2
iload_1
ineg
ireturn
.end method

.method public double(I)I
.limit stack 2
.limit locals 2
iload_1
bipush 1
ishl
ireturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

