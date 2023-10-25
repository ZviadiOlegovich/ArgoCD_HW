package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("---App started---")
	ticker := time.NewTicker(60 * time.Second)
	for range ticker.C {
		fmt.Println("Hello World")
	}
}
