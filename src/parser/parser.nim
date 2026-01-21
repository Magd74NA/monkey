import ../token/token as tok
import ../lexer/lexer as lex
import ../ast/ast as ast

type Parser = object
    l: lex.Lexer
    curToken: tok.Token
    peekToken: tok.Token

proc nextToken(p: var Parser) =
    p.curToken = p.peekToken
    p.peekToken = p.l.NextToken()

proc parseProgram (p: var Parser): ast.Program =
    return nil
