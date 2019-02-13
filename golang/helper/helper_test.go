package helper

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGenerateData(t *testing.T) {
	out := GenerateData(20, 100, 200)
	assert.Equal(t, len(out), 20, "count not equal")
	t.Log(out)
}

func BenchmarkGenerateData(b *testing.B) {
	for i:=0; i<b.N; i++ {
		GenerateData(5000, 0, 100)
	}
}

func BenchmarkGenerateNearlyOrderedData(b *testing.B) {
	for i:=0; i<b.N; i++ {
		GenerateNearlyOrderedData(5000, 100)
	}
}

func TestGenerateNearlyOrderedData(t *testing.T) {
	out := GenerateNearlyOrderedData(30, 2)
	assert.Equal(t, len(out), 30, "count not equal")
	t.Log(out)
}

