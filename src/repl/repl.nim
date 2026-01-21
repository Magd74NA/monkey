
import std/rdstdin
import ../lexer/lexer
import ../token/token

const PROMPT = ">> "

proc start*() =
    var line: string
    while true:
        let ok = readLineFromStdin(PROMPT, line)
        if not ok: break # ctrl-C or ctrl-D will cause a break
        if line.len > 0:
            let l = lexer.Init(line)
            var tok = l.NextToken
            while tok.Type != EOF:
                echo tok, "\n"
                tok = l.NextToken
    echo "exiting"
