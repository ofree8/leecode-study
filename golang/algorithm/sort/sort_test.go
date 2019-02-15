package sort

import (
	"fmt"
	"leecode-go/helper"
	"sort"
	"testing"

	"github.com/stretchr/testify/assert"
)

// const debug = true
const debug = false

func TestSorts(t *testing.T) {
	input := helper.GenerateData(1000000, 0, 1000)
	// input := helper.GenerateNearlyOrderedData(100000, 100)
	cases := []struct {
		name     string
		callback func([]int)
	}{
		// {
		// 	"bubble sort", func(input []int) {
		// 		BubbleSort(input)
		// 	}},
		// {
		// 	"selection sort", func(input []int) {
		// 		SelectSort(input)
		// 	}},
		// {
		// 	"insert sort", func(input []int) {
		// 		InsertSort(input)
		// 	}},
		// {
		// 	"insert sort optimized", func(input []int) {
		// 		InsertSort1(input)
		// 	}},
		{
			"merge sort", func(input []int) {
				MergeSort(input)
			}},
		{
			"quick sort", func(input []int) {
				QuickSort(input)
			}},
		{
			"system sort", func(input []int) {
				sort.Ints(input)
			}},
	}

	if debug {
		fmt.Println(input)
	}
	for _, oneCase := range cases {
		tempInput := make([]int, len(input))
		copy(tempInput, input)
		t.Run(oneCase.name, func(t *testing.T) {
			oneCase.callback(tempInput)
		})
		if debug {
			fmt.Println(tempInput)
		}
		assert.True(t, helper.IsSorted(tempInput), fmt.Sprint(oneCase.name, " failed"))
	}
}
