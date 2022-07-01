package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"
	"time"

	"github.com/gorilla/mux"
)

type Task struct {
	ID         string `json:"id"`
	TaskName   string `json:"task_name"`
	TaskDetail string `json:"task_detail"`
	Date       string `json:"date"`
}

var tasks []Task

func allTasks() {
	task := Task{
		ID:         "1",
		TaskName:   "Complete Task Management System",
		TaskDetail: "Today I have to complete task management system project",
		Date:       "30-06-2022",
	}
	tasks = append(tasks, task)
	task1 := Task{
		ID:         "2",
		TaskName:   "Work on GoLang Project",
		TaskDetail: "Today I have to work on GoLang",
		Date:       "30-06-2022",
	}
	tasks = append(tasks, task1)
}

func createTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var task Task
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(1000))
	task.Date = time.Now().Format("01-02-2006")
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(task)
}
func deleteTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("We are in server")
}
func getTask(w http.ResponseWriter, r *http.Request) {
	taskID := mux.Vars(r)
	flag := false
	for i := 0; i < len(tasks); i++ {
		if taskID["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if !flag {
		json.NewEncoder(w).Encode(map[string]string{"Status": "Not Found"})
	}
}
func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}
func updateTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("We are in server")
}
func router() {
	router := mux.NewRouter()
	router.HandleFunc("/getTasks", getTasks).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/getTask/{id}", getTask).Methods("GET")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8080", router))
}
func main() {
	allTasks()
	fmt.Println("hello")
	router()
}
