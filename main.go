package main

import (
	"math/rand"
	"time"

	"github.com/mingrammer/cfmt"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	opts := ParseOptions()
        for {
	if err := Run(opts); err != nil {
		cfmt.Warningln(err.Error())
	}
    }
}
