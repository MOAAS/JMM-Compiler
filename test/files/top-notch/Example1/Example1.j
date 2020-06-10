.class public Example1
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
new ArrayStorer
dup
iconst_5
newarray int
invokespecial ArrayStorer/<init>([I)V
astore_1
new Example1
dup
invokespecial Example1/<init>()V
aload_1
invokevirtual ArrayStorer/getArray()[I
invokevirtual Example1/setIncreasing([I)[I
pop
aload_1
invokevirtual ArrayStorer/product()I
invokestatic io/println(I)V
aload_1
invokevirtual ArrayStorer/sum()I
invokestatic io/println(I)V
new ArrayStorer
dup
bipush 10
newarray int
bipush 10
invokespecial ArrayStorer/<init>([II)V
invokevirtual ArrayStorer/sum()I
invokestatic io/println(I)V
return
.end method

.method public setIncreasing([I)[I
.limit stack 4
.limit locals 3
iconst_0
istore_2
iload_2
aload_1
arraylength
if_icmpge LABEL2
LABEL1:
aload_1
iload_2
iload_2
iconst_1
iadd
iastore
iinc 2 1
iload_2
aload_1
arraylength
if_icmplt LABEL1
LABEL2:
aload_1
areturn
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

