package main

import (
	"fmt"
	// "log"
	// "http"
	// "gorilla"
)

type Task struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date       string `json:"date"`
}

//  tasks []Task
func main() {
	fmt.Println("hello")
}
