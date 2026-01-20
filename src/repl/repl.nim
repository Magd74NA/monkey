
import std/rdstdin

const PROMPT = ">> "

proc start*() =
    var line: string
    while true:
        let ok = readLineFromStdin(PROMPT, line)
        if not ok: break # ctrl-C or ctrl-D will cause a break
        if line.len > 0: echo line
    echo "exiting"
