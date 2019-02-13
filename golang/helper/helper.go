package helper

import (
	"math/rand"
	"time"
)

// GenerateData 生成所有元素都大于min 小于max的数组
func GenerateData(count, min, max int) []int {
	out := make([]int, 0, count+1)
	rand.Seed(time.Now().Unix())
	for i := 0; i < count; i++ {
		out = append(out, rand.Intn(max-min)+min)
	}
	return out
}

// GenerateNearlyOrderedData 生成几乎有序的数组
func GenerateNearlyOrderedData(count, swapTimes int) []int {
	out := make([]int, count)
	rand.Seed(time.Now().Unix())
	for i := 0; i < count; i++ {
		out[i] = i
	}
	for i := 0; i < swapTimes; i++ {
		j := rand.Intn(count)
		k := count - j
		out[j], out[k] = out[k], out[j]
	}
	return out
}

func IsSorted(input []int) bool {
	inputLen := len(input)
	for i := 0; i < inputLen; i++ {
		if i < inputLen-1 && input[i] > input[i+1] {
			return false
		}
	}
	return true
}

// CheckReverseCount 检测一个数组的逆序对数量
func CheckReverseCount(input []int) int {
	return 0
}
