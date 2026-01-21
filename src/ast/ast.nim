# import std/sequtils
import ../token/token as tok

type NodeKind* = enum
      nodeLetStatement
      nodeIdentifier
      nodeIntegerLiteral

type Node* = ref object
      token*: tok.Token
      case kind*: NodeKind
            of nodeLetStatement:
                  name*: Node 
                  value*: Node 
            of nodeIdentifier:
                  identValue*: string
            of nodeIntegerLiteral:
                  intValue*: int

type Program* = object
      statements*: seq[Node]

proc tokenLiteral*(node: Node): string =
  case node.kind
  of nodeLetStatement: node.token.literal
  of nodeIdentifier: node.identValue
  of nodeIntegerLiteral: $node.intValue

proc tokenLiteral*(p: Program): string =
  if p.statements.len > 0:
    p.statements[0].tokenLiteral()
  else:
    ""

