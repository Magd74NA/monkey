# import std/sequtils
import ../token/token as tok

type
    Node = object
        TokenLiteral: proc()
    Statement = object
        Node: Node
    Expression = object
        Node: Node
    Program* = object
        Statements: seq[Statement] # Programs are a dynamic array (nim sequence) of statements
    Identifier = object
        Token: tok.Token
        Value: string
    LetStatement = object
        Token: tok.Token
        Name: Identifier
        Value: Expression



proc statementNode(ls: var LetStatement) =
    var PLACEHOLDER = "TODO"

proc TokenLiteral(ls: LetStatement): string =
    return ls.Token.Literal

proc expressionNode(i: var Identifier) =
    var PLACEHOLDER = "TODO"

proc TokenLiteral(i: Identifier): string =
    return i.Token.Literal
