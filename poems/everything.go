package main

import (
  "fmt"
  "regexp"
)

func main() {
  thingsYouDo := [...]string{
    "when you sing",
    "when you laugh",
    "when you talk",
    "when you dance",
    "when you pray",
    "when you teach",
    "when you smile",
  }
  exp := regexp.MustCompile(`when you .*`)
  for _, thingYouDo := range thingsYouDo {
    if exp.MatchString(thingYouDo) {
        fmt.Println(thingYouDo, "you captivate me")
    }
  }
}
