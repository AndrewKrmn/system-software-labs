#!/usr/bin/awk -f

BEGIN {
    message = "WECRLTEERDSOEEFEAOCAIVDEN"
    numRails = 3
    msgLength = length(message)
    
    for (i = 0; i < numRails; i++) {
        rails[i] = ""
    }

    rail = 0
    dir = 1  

    for (i = 0; i < msgLength; i++) {
        rails[rail] = rails[rail] substr(message, i + 1, 1)
        rail += dir
        if (rail == 0 || rail == numRails - 1) {
            dir *= -1
        }
    }

    encodedMessage = ""
    for (i = 0; i < numRails; i++) {
        encodedMessage = encodedMessage rails[i]
    }

    print encodedMessage
}

