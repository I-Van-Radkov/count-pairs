package counter

import (
	"strings"
	"unicode"
)

func CountPairs(text, word1, word2 string, maxDist int) int {
	if maxDist < 0 || word1 == "" || word2 == "" {
		return 0
	}

	words := getTokens(text)

	total := 0
	left := 0
	countWords := make(map[string]int)

	for right := 0; right < len(words); right++ {
		for right-left-1 > maxDist {
			countWords[words[left]]--
			if countWords[words[left]] <= 0 {
				delete(countWords, words[left])
			}
			left++
		}

		curWord := words[right]
		if curWord == word2 {
			for left < right {
				countWords[words[left]]--
				if countWords[words[left]] == 0 {
					delete(countWords, words[left])
				}

				if words[left] == word1 {
					total++
					break
				}

				left++
			}
		}

		countWords[curWord]++
	}

	return total
}

func getTokens(text string) []string {
	cleaned := strings.Map(func(r rune) rune {
		if unicode.IsPunct(r) || r == '\n' || r == '\r' {
			return ' '
		}
		return r
	}, text)

	return strings.Fields(cleaned)
}
