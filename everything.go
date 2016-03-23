package main

import (
	"fmt"
	"regexp"
)

func main() {
	things := []string{
		"when you sing",
		"when you laugh",
		"when you talk",
		"when you dance",
		"when you pray",
		"when you teach",
		"when you smile",
	}
	e := regexp.MustCompile(`when you .*`)
	for _, t := range things {
		if e.MatchString(t) {
			fmt.Println(t, "you captivate me")
		}
	}
}
