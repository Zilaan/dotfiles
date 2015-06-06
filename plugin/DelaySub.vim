" How to use:
" ':%s/\d\d:\d\d:\d\d/\=DelaySub(submatch(0), delay)
" delay seconds in int

function! DelaySub(text, delay)
    " Convert the input to array, split at ':'
    let time = split(a:text, ":")

    " Convert everything to seconds and add delay
    let sec = 3600 * time[0] + 60 * time[1] + time[2] + a:delay

    " Convert seconds to HH:MM:SS and split
    let newTime = split(strftime("%T", sec), ":")

    " Remove 1 from hour (strftime adds 1 extra hour for some reason)
    let newTime[0] = newTime[0] - 1

    " Append a proceeding zero if needed (1 --> 01)
    if len(newTime[0]) == 1
        let newTime[0] = "0" . newTime[0]
    endif

    " Join the array with ':' and return the delayed time HH:MM:SS
    return join(newTime, ":")
endfunction
