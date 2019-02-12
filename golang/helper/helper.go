package helper

import (
	"math/rand"
	"time"
)

func GenerateData(count, min, max int) []int {
	out := make([]int, 0, count + 1)
	rand.Seed(time.Now().Unix())
	for i := 0; i < count; i++ {
		out = append(out, rand.Intn(max-min) + min)
	}
	return out
}

func GenerateNearlyOrderedData(count, swapTimes int) []int {
	out := make([]int, 0, count + 1)
	rand.Seed(time.Now().Unix())
	for i := 0; i < count; i++ {
		out = append(out, i)
	}
	for i:= 0; i < swapTimes; i++ {
		j := rand.Intn(count) - 1
		k := count - j
		out[j], out[k] = out[k], out[j]
	}
	return out
}
