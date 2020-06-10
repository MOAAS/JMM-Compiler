.class public ArgConsTester
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 2
new IntStorer
dup
bipush 10
invokespecial IntStorer/<init>(I)V
astore_1
aload_1
invokevirtual IntStorer/print()V
new IntStorer
dup
invokespecial IntStorer/<init>()V
astore_1
aload_1
invokevirtual IntStorer/print()V
return
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

