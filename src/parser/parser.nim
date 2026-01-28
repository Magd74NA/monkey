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

proc Init(l: Lexer): Parser =
    var p = Parser(l: l)
    p.nextToken()
    p.nextToken()

    return p

proc peekTokenIs(p: var Parser, t: tok.TokenType): bool =
    return p.peekToken.Type == t

proc expectPeek(p: var Parser, t: tok.TokenType): bool =
    if p.peekTokenIs(t):
        p.nextToken
        return true
    else:
        return false

proc parseLetStatement(p: var Parser): ast.Node =
    # Create a Node with kind = nodeLetStatement
    result = ast.Node(
        kind: ast.nodeLetStatement,
        token: p.curToken
    )
    if not p.expectPeek(tok.IDENT):
        return nil

    result.name = ast.Node(
        kind: ast.nodeIdentifier,
        token: p.curToken,
        identValue: p.curToken.Literal
    )

    if not p.expectPeek(tok.ASSIGN):
        return nil
    # Parse Expression?
    # Skip Expression Parsing for Now
    while p.curToken.Type != tok.SEMICOLON:
        p.nextToken

proc parseStatement (p: var Parser): ast.Node =
    case p.curToken.Type:
    of tok.LET :
        return p.parseLetStatement()
    else :
        return nil

proc parseProgram (p: var Parser): ast.Program =
    var program: ast.Program
    while p.curToken.Type != tok.EOF:
        let stmt = p.parseStatement
        if stmt != nil:
            program.statements.add(stmt)
        p.nextToken()
    return program
        

