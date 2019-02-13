package sort

import (
	"fmt"
	"leecode-go/helper"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestSorts(t *testing.T) {
	input := helper.GenerateData(50000, 0, 100)
	cases := []struct {
		name     string
		callback func([]int)
	}{
		{"bubble sort", func(input []int) {
			BubbleSort(input)
		}},
		{"selection sort", func(input []int) {
			SelectSort(input)
		}},
		{"insert sort", func(input []int) {
			InsertSort(input)
		}},
		{"insert sort optimized", func(input []int) {
			InsertSort1(input)
		}},
	}
	for _, oneCase := range cases {
		tempInput := make([]int, len(input))
		copy(tempInput, input)
		t.Run(oneCase.name, func(t *testing.T) {
			oneCase.callback(tempInput)
		})
		assert.True(t, helper.IsSorted(tempInput), fmt.Sprint(oneCase.name, "failed"))
	}
}
