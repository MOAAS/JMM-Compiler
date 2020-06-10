.class public TicTacToe
.super java/lang/Object
.field field_row0 [I
.field field_row1 [I
.field field_row2 [I
.field field_whoseturn I
.field field_movesmade I
.field field_pieces [I
.method public init()Z
.limit stack 5
.limit locals 1
aload_0
iconst_3
newarray int
putfield TicTacToe/field_row0 [I
aload_0
iconst_3
newarray int
putfield TicTacToe/field_row1 [I
aload_0
iconst_3
newarray int
putfield TicTacToe/field_row2 [I
aload_0
iconst_2
newarray int
putfield TicTacToe/field_pieces [I
aload_0
getfield TicTacToe/field_pieces [I
iconst_0
iconst_1
iastore
aload_0
getfield TicTacToe/field_pieces [I
iconst_1
iconst_2
iastore
aload_0
iconst_0
putfield TicTacToe/field_whoseturn I
aload_0
iconst_0
putfield TicTacToe/field_movesmade I
iconst_1
ireturn
.end method

.method public getRow0()[I
.limit stack 1
.limit locals 1
aload_0
getfield TicTacToe/field_row0 [I
areturn
.end method

.method public getRow1()[I
.limit stack 1
.limit locals 1
aload_0
getfield TicTacToe/field_row1 [I
areturn
.end method

.method public getRow2()[I
.limit stack 1
.limit locals 1
aload_0
getfield TicTacToe/field_row2 [I
areturn
.end method

.method public MoveRow([II)Z
.limit stack 4
.limit locals 4
iload_2
ifge LABEL1
iconst_0
istore_3
goto LABEL2
LABEL1:
iconst_2
iload_2
if_icmpge LABEL3
iconst_0
istore_3
goto LABEL4
LABEL3:
iconst_0
aload_1
iload_2
iaload
if_icmpge LABEL5
iconst_0
istore_3
goto LABEL6
LABEL5:
aload_1
iload_2
aload_0
getfield TicTacToe/field_pieces [I
aload_0
getfield TicTacToe/field_whoseturn I
iaload
iastore
aload_0
aload_0
getfield TicTacToe/field_movesmade I
iconst_1
iadd
putfield TicTacToe/field_movesmade I
iconst_1
istore_3
LABEL6:
LABEL4:
LABEL2:
iload_3
ireturn
.end method

.method public Move(II)Z
.limit stack 3
.limit locals 4
iload_1
iconst_0
if_icmplt LABEL11
iconst_0
goto LABEL12
LABEL11:
iconst_1
LABEL12:
ifeq LABEL9
iconst_0
goto LABEL10
LABEL9:
iconst_1
LABEL10:
iconst_0
iload_1
if_icmplt LABEL15
iconst_0
goto LABEL16
LABEL15:
iconst_1
LABEL16:
ifeq LABEL13
iconst_0
goto LABEL14
LABEL13:
iconst_1
LABEL14:
iand
ifeq LABEL7
aload_0
aload_0
getfield TicTacToe/field_row0 [I
iload_2
invokevirtual TicTacToe/MoveRow([II)Z
istore_3
goto LABEL8
LABEL7:
iload_1
iconst_1
if_icmplt LABEL21
iconst_0
goto LABEL22
LABEL21:
iconst_1
LABEL22:
ifeq LABEL19
iconst_0
goto LABEL20
LABEL19:
iconst_1
LABEL20:
iconst_1
iload_1
if_icmplt LABEL25
iconst_0
goto LABEL26
LABEL25:
iconst_1
LABEL26:
ifeq LABEL23
iconst_0
goto LABEL24
LABEL23:
iconst_1
LABEL24:
iand
ifeq LABEL17
aload_0
aload_0
getfield TicTacToe/field_row1 [I
iload_2
invokevirtual TicTacToe/MoveRow([II)Z
istore_3
goto LABEL18
LABEL17:
iload_1
iconst_2
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
iconst_2
iload_1
if_icmplt LABEL35
iconst_0
goto LABEL36
LABEL35:
iconst_1
LABEL36:
ifeq LABEL33
iconst_0
goto LABEL34
LABEL33:
iconst_1
LABEL34:
iand
ifeq LABEL27
aload_0
aload_0
getfield TicTacToe/field_row2 [I
iload_2
invokevirtual TicTacToe/MoveRow([II)Z
istore_3
goto LABEL28
LABEL27:
iconst_0
istore_3
LABEL28:
LABEL18:
LABEL8:
iload_3
ireturn
.end method

.method public inbounds(II)Z
.limit stack 2
.limit locals 4
iload_1
ifge LABEL37
iconst_0
istore_3
goto LABEL38
LABEL37:
iload_2
ifge LABEL39
iconst_0
istore_3
goto LABEL40
LABEL39:
iconst_2
iload_1
if_icmpge LABEL41
iconst_0
istore_3
goto LABEL42
LABEL41:
iconst_2
iload_2
if_icmpge LABEL43
iconst_0
istore_3
goto LABEL44
LABEL43:
iconst_1
istore_3
LABEL44:
LABEL42:
LABEL40:
LABEL38:
iload_3
ireturn
.end method

.method public changeturn()Z
.limit stack 3
.limit locals 1
aload_0
iconst_1
aload_0
getfield TicTacToe/field_whoseturn I
isub
putfield TicTacToe/field_whoseturn I
iconst_1
ireturn
.end method

.method public getCurrentPlayer()I
.limit stack 2
.limit locals 1
aload_0
getfield TicTacToe/field_whoseturn I
iconst_1
iadd
ireturn
.end method

.method public winner()I
.limit stack 4
.limit locals 4
iconst_1
ineg
istore_2
iconst_3
newarray int
astore_2
aload_0
getfield TicTacToe/field_row0 [I
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_0
getfield TicTacToe/field_row0 [I
iconst_0
iaload
if_icmplt LABEL47
iconst_0
goto LABEL48
LABEL47:
iconst_1
LABEL48:
iand
ifeq LABEL45
aload_0
getfield TicTacToe/field_row0 [I
iconst_0
iaload
istore_2
goto LABEL46
LABEL45:
aload_0
getfield TicTacToe/field_row1 [I
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_0
getfield TicTacToe/field_row1 [I
iconst_0
iaload
if_icmplt LABEL51
iconst_0
goto LABEL52
LABEL51:
iconst_1
LABEL52:
iand
ifeq LABEL49
aload_0
getfield TicTacToe/field_row1 [I
iconst_0
iaload
istore_2
goto LABEL50
LABEL49:
aload_0
getfield TicTacToe/field_row2 [I
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_0
getfield TicTacToe/field_row2 [I
iconst_0
iaload
if_icmplt LABEL55
iconst_0
goto LABEL56
LABEL55:
iconst_1
LABEL56:
iand
ifeq LABEL53
aload_0
getfield TicTacToe/field_row2 [I
iconst_0
iaload
istore_2
goto LABEL54
LABEL53:
iconst_0
istore_1
iload_2
iconst_1
if_icmplt LABEL59
iconst_0
goto LABEL60
LABEL59:
iconst_1
LABEL60:
iload_1
iconst_3
if_icmplt LABEL61
iconst_0
goto LABEL62
LABEL61:
iconst_1
LABEL62:
iand
ifeq LABEL58
LABEL57:
aload_2
iconst_0
aload_0
getfield TicTacToe/field_row0 [I
iload_1
iaload
iastore
aload_2
iconst_1
aload_0
getfield TicTacToe/field_row1 [I
iload_1
iaload
iastore
aload_2
iconst_2
aload_0
getfield TicTacToe/field_row2 [I
iload_1
iaload
iastore
aload_2
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_2
iconst_0
iaload
if_icmplt LABEL65
iconst_0
goto LABEL66
LABEL65:
iconst_1
LABEL66:
iand
ifeq LABEL63
aload_2
iconst_0
iaload
istore_2
goto LABEL64
LABEL63:
LABEL64:
iinc 1 1
iload_2
iconst_1
if_icmplt LABEL67
iconst_0
goto LABEL68
LABEL67:
iconst_1
LABEL68:
iload_1
iconst_3
if_icmplt LABEL69
iconst_0
goto LABEL70
LABEL69:
iconst_1
LABEL70:
iand
ifne LABEL57
LABEL58:
iload_2
iconst_1
if_icmpge LABEL71
aload_2
iconst_0
aload_0
getfield TicTacToe/field_row0 [I
iconst_0
iaload
iastore
aload_2
iconst_1
aload_0
getfield TicTacToe/field_row1 [I
iconst_1
iaload
iastore
aload_2
iconst_2
aload_0
getfield TicTacToe/field_row2 [I
iconst_2
iaload
iastore
aload_2
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_2
iconst_0
iaload
if_icmplt LABEL75
iconst_0
goto LABEL76
LABEL75:
iconst_1
LABEL76:
iand
ifeq LABEL73
aload_2
iconst_0
iaload
istore_2
goto LABEL74
LABEL73:
aload_2
iconst_0
aload_0
getfield TicTacToe/field_row0 [I
iconst_2
iaload
iastore
aload_2
iconst_1
aload_0
getfield TicTacToe/field_row1 [I
iconst_1
iaload
iastore
aload_2
iconst_2
aload_0
getfield TicTacToe/field_row2 [I
iconst_0
iaload
iastore
aload_2
invokestatic BoardBase/sameArray([I)Z
iconst_0
aload_2
iconst_0
iaload
if_icmplt LABEL79
iconst_0
goto LABEL80
LABEL79:
iconst_1
LABEL80:
iand
ifeq LABEL77
aload_2
iconst_0
iaload
istore_2
goto LABEL78
LABEL77:
LABEL78:
LABEL74:
goto LABEL72
LABEL71:
LABEL72:
LABEL54:
LABEL50:
LABEL46:
iload_2
iconst_1
if_icmplt LABEL83
iconst_0
goto LABEL84
LABEL83:
iconst_1
LABEL84:
aload_0
getfield TicTacToe/field_movesmade I
bipush 9
if_icmplt LABEL87
iconst_0
goto LABEL88
LABEL87:
iconst_1
LABEL88:
ifeq LABEL85
iconst_0
goto LABEL86
LABEL85:
iconst_1
LABEL86:
iand
bipush 9
aload_0
getfield TicTacToe/field_movesmade I
if_icmplt LABEL91
iconst_0
goto LABEL92
LABEL91:
iconst_1
LABEL92:
ifeq LABEL89
iconst_0
goto LABEL90
LABEL89:
iconst_1
LABEL90:
iand
ifeq LABEL81
iconst_0
istore_2
goto LABEL82
LABEL81:
LABEL82:
iload_2
ireturn
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 6
new TicTacToe
dup
invokespecial TicTacToe/<init>()V
astore_1
aload_1
invokevirtual TicTacToe/init()Z
pop
aload_1
invokevirtual TicTacToe/winner()I
iconst_1
ineg
if_icmplt LABEL97
iconst_0
goto LABEL98
LABEL97:
iconst_1
LABEL98:
ifeq LABEL95
iconst_0
goto LABEL96
LABEL95:
iconst_1
LABEL96:
iconst_1
ineg
aload_1
invokevirtual TicTacToe/winner()I
if_icmplt LABEL101
iconst_0
goto LABEL102
LABEL101:
iconst_1
LABEL102:
ifeq LABEL99
iconst_0
goto LABEL100
LABEL99:
iconst_1
LABEL100:
iand
ifeq LABEL94
LABEL93:
iconst_0
istore_0
iload_0
ifeq LABEL105
iconst_0
goto LABEL106
LABEL105:
iconst_1
LABEL106:
ifeq LABEL104
LABEL103:
aload_1
invokevirtual TicTacToe/getRow0()[I
aload_1
invokevirtual TicTacToe/getRow1()[I
aload_1
invokevirtual TicTacToe/getRow2()[I
invokestatic BoardBase/printBoard([I[I[I)V
aload_1
invokevirtual TicTacToe/getCurrentPlayer()I
istore_0
iload_0
invokestatic BoardBase/playerTurn(I)[I
astore_0
aload_1
aload_0
iconst_0
iaload
aload_0
iconst_1
iaload
invokevirtual TicTacToe/inbounds(II)Z
ifeq LABEL109
iconst_0
goto LABEL110
LABEL109:
iconst_1
LABEL110:
ifeq LABEL107
invokestatic BoardBase/wrongMove()V
goto LABEL108
LABEL107:
aload_1
aload_0
iconst_0
iaload
aload_0
iconst_1
iaload
invokevirtual TicTacToe/Move(II)Z
ifeq LABEL113
iconst_0
goto LABEL114
LABEL113:
iconst_1
LABEL114:
ifeq LABEL111
invokestatic BoardBase/placeTaken()V
goto LABEL112
LABEL111:
iconst_1
istore_0
LABEL112:
LABEL108:
iload_0
ifeq LABEL115
iconst_0
goto LABEL116
LABEL115:
iconst_1
LABEL116:
ifne LABEL103
LABEL104:
aload_1
invokevirtual TicTacToe/changeturn()Z
pop
aload_1
invokevirtual TicTacToe/winner()I
iconst_1
ineg
if_icmplt LABEL119
iconst_0
goto LABEL120
LABEL119:
iconst_1
LABEL120:
ifeq LABEL117
iconst_0
goto LABEL118
LABEL117:
iconst_1
LABEL118:
iconst_1
ineg
aload_1
invokevirtual TicTacToe/winner()I
if_icmplt LABEL123
iconst_0
goto LABEL124
LABEL123:
iconst_1
LABEL124:
ifeq LABEL121
iconst_0
goto LABEL122
LABEL121:
iconst_1
LABEL122:
iand
ifne LABEL93
LABEL94:
aload_1
invokevirtual TicTacToe/getRow0()[I
aload_1
invokevirtual TicTacToe/getRow1()[I
aload_1
invokevirtual TicTacToe/getRow2()[I
invokestatic BoardBase/printBoard([I[I[I)V
aload_1
invokevirtual TicTacToe/winner()I
istore_0
iload_0
invokestatic BoardBase/printWinner(I)V
return
.end method

.method public <init>()V
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

