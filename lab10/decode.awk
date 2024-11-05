#!/usr/bin/awk -f

BEGIN {
    encodedMessage = "WECRLTEERDSOEEFEAOCAIVDEN"
    numRails = 3
    msgLength = length(encodedMessage)

    for (i = 0; i < numRails; i++) {
        fence[i] = ""
    }

    row = 0
    dir = 1

    for (i = 0; i < msgLength; i++) {
        fence[row] = fence[row] "?"
        row += dir
        if (row == 0 || row == numRails - 1) {
            dir *= -1
        }
    }

    msgIndex = 1
    for (i = 0; i < numRails; i++) {
        split(fence[i], arr, "")
        for (j = 1; j <= length(fence[i]); j++) {
            if (msgIndex <= msgLength) {
                arr[j] = substr(encodedMessage, msgIndex, 1)
                msgIndex++
            }
        }
        fence[i] = ""
        for (k = 1; k <= length(arr); k++) {
            fence[i] = fence[i] arr[k]
        }
    }

    decodedMessage = ""
    row = 0
    dir = 1
    for (i = 0; i < msgLength; i++) {
        decodedMessage = decodedMessage substr(fence[row], 1, 1)
        fence[row] = substr(fence[row], 2)
        row += dir
        if (row == 0 || row == numRails - 1) {
            dir *= -1
        }
    }

    print decodedMessage
}

