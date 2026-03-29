package main

import (
	"fmt"
	"os"
	"strconv"

	"github.com/I-Van-Radkov/count-pairs/internal/counter"
)

func main() {
	if len(os.Args) != 5 {
		fmt.Println("Ошибка: требуется 4 аргумента")
		os.Exit(1)
	}

	filePath := os.Args[1]
	word1 := os.Args[2]
	word2 := os.Args[3]
	maxDist, err := strconv.Atoi(os.Args[4])
	if err != nil || maxDist < 0 {
		fmt.Println("Ошибка: максимальное расстояние должно быть неотрицательным целым числом")
		os.Exit(1)
	}

	data, err := os.ReadFile(filePath)
	if err != nil {
		fmt.Printf("Ошибка чтения файла %s: %v\n", filePath, err)
		os.Exit(1)
	}

	count := counter.CountPairs(string(data), word1, word2, maxDist)
	fmt.Println(count)
}
