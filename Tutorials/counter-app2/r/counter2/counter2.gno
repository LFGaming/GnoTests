package counter2

import (
    "gno.land/p/demo/ufmt"
)

var count int

func Increment() {
    count++
}

func Decrement() {
    count--
}

func Render(_ string) string {
    Increment()
    return ufmt.Sprintf("Count: %d", count)
}
