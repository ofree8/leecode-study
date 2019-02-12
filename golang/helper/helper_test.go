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

func TestGenerateNearlyOrderedData(t *testing.T) {
	out := GenerateNearlyOrderedData(30, 2)
	assert.Equal(t, len(out), 30, "count not equal")
	t.Log(out)
}
