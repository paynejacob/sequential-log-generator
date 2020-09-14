package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
)

const logTemplate = "{\"log\": \"%s - %d\", \"stream\": \"stderr\", \"time\": \"2020-09-11T22:42:04.879103858Z\"}\n"

func main() {
	var files []*os.File

	fileNames := os.Args[1]
	preloadCount, err := strconv.ParseInt(os.Args[2], 10, 64)

	if err != nil {
		panic(err)
	}

	// create files
	for _, fileName := range strings.Split(fileNames, ",") {
		f, err := os.Create(fileName)
		if err != nil {
			panic(err)
		}

		files = append(files, f)
	}

	for i := int64(0); i < 9223372036854775807; i++ {

		if i > preloadCount {
			time.Sleep(1 * time.Second)
		}
		for ii := range files {
			_, err := files[ii].Write([]byte(fmt.Sprintf(logTemplate, files[ii].Name(), i)))
			if err != nil {
				panic(err)
			}
		}
	}
}
