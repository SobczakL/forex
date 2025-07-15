package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/joho/godotenv"
)

func main() {
	baseURL := "https://api.currencyfreaks.com/v2.0/"
	endpoint := "rates/latest"

	err := godotenv.Load()
	if err != nil {
		log.Fatal("Env not loading")
	}

	apiKey := os.Getenv("API_KEY_FOREX")

	urlPath := fmt.Sprintf("%s%s?apikey=%s&symbols=JPY,CAD", baseURL, endpoint, apiKey)
	response, err := http.Get(urlPath)
	if err != nil {
		fmt.Println("Error fetching")
	}

	defer response.Body.Close()

	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		fmt.Println("Error reading response")
	}

	fmt.Print(string(body))
}
