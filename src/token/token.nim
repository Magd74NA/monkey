import std/tables

const
    ILLEGAL* = "ILLEGAL"
    EOF* = "EOF"

    #Idents and literals
    IDENT* = "IDENT" # add, foobar, x, y, ...
    INT* = "INT"     # 1343456

    #Operators
    ASSIGN* = "="
    PLUS* = "+"
    MINUS* = "-"
    SLASH* = "/"
    ASTERISK* = "*"
    GT* = ">"
    LT* = "<"
    BANG* = "!"

    #Multi char operators
    EQ* = "=="
    NOT_EQ* = "!="

    #Delimeters
    COMMA* = ","
    SEMICOLON* = ";"

    LPAREN* = "("
    RPAREN* = ")"
    LBRACE* = "{"
    RBRACE* = "}"

    #Keywords
    FUNCTION* = "FUNCTION"
    LET* = "LET"
    RETURN* = "RETURN"
    IF* = "IF"
    TRUE* = "TRUE"
    ELSE* = "ELSE"
    FALSE* = "FALSE"

type TokenType* = string

type Token* = object
    Type*: TokenType
    Literal*: string

const keywords* = tables.toTable([
    ("fn", FUNCTION),
    ("let", LET),
    ("return", RETURN),
    ("if", IF),
    ("else", ELSE),
    ("true", TRUE),
    ("false", FALSE)
    ])

func LookupIdent*(ident: string): TokenType =
    if keywords.hasKey(ident):
        return keywords[ident]
    else:
        return IDENT
