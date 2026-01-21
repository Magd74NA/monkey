import ../token/token

type
    Lexer* = object
        line: string
        position: int
        readPosition: int
        ch: char #Consider switching to unicode runes?

proc readChar(self: var Lexer) =
    if self.readPosition >= self.line.len:
        self.ch = '\0'
    else:
        self.ch = self.line[self.readPosition]
    self.position = self.readPosition
    self.readPosition += 1

func Init*(input: string): Lexer =
    result = Lexer(line: input)
    result.readChar

func peekChar*(self: Lexer): char =
    if self.readPosition >= self.line.len:
        return '\0'
    else:
        return self.line[self.readPosition]

func newToken(tokenType: TokenType, ch: char): Token =
    return Token(Type: tokenType, Literal: $ch)

func isDigit(ch: char): bool =
    return '0' <= ch and ch <= '9'

func isLetter(ch: char): bool =
    return ('a' <= ch and ch <= 'z') or ('A' <= ch and ch <= 'Z') or ch == '_'

proc skipWhitespace(self: var Lexer) =
    while self.ch == ' ' or self.ch == '\t' or self.ch == '\n' or self.ch == '\r':
        self.readChar

proc readIdentifier(self: var Lexer): string =
    let start = self.position
    while isLetter(self.ch):
        self.readChar
    return self.line[start..self.position-1]

proc readDigit(self: var Lexer): string =
    let start = self.position
    while isDigit(self.ch):
        self.readChar
    return self.line[start..self.position-1]

proc NextToken*(self: var Lexer): Token =
    var tok: Token
    self.skipWhitespace
    case self.ch:
        of ';':
            tok = newToken(SEMICOLON, self.ch)
        of '(':
            tok = newToken(LPAREN, self.ch)
        of ')':
            tok = newToken(RPAREN, self.ch)
        of ',':
            tok = newToken(COMMA, self.ch)
        of '+':
            tok = newToken(PLUS, self.ch)
        of '-':
            tok = newToken(MINUS, self.ch)
        of '/':
            tok = newToken(SLASH, self.ch)
        of '*':
            tok = newToken(ASTERISK, self.ch)
        of '>':
            tok = newToken(GT, self.ch)
        of '<':
            tok = newToken(LT, self.ch)
        of '{':
            tok = newToken(LBRACE, self.ch)
        of '}':
            tok = newToken(RBRACE, self.ch)
        of '=':
            if self.peekChar == '=':
                let ch = self.ch
                self.readChar
                let literal = $ch & $self.ch
                tok = Token(Type: EQ, Literal: literal)
            else:
                tok = newToken(ASSIGN, self.ch)
        of '!':
            if self.peekChar == '=':
                let ch = self.ch
                self.readChar
                let literal = $ch & $self.ch
                tok = Token(Type: NOT_EQ, Literal: literal)
            else:
                tok = newToken(BANG, self.ch)
        of '\0':
            tok.Literal = ""
            tok.Type = EOF
        else:
            if isLetter(self.ch):
                tok.Literal = self.readIdentifier
                tok.Type = LookupIdent(tok.Literal)
                return tok
            else:
                if isDigit(self.ch):
                    tok.Literal = self.readDigit
                    tok.Type = INT
                    return tok
                else:
                    tok = newToken(ILLEGAL, self.ch)
    self.readChar
    return tok
