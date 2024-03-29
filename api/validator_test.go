package api

import (
	"testing"

	"github.com/go-playground/validator/v10"
	"github.com/stretchr/testify/require"
)

func TestValidCurrency(t *testing.T) {
	v := validator.New()

	v.RegisterValidation("currency", validCurrency)

	type TestStruct struct {
		Currency string `validate:"currency"`
	}

	err := v.Struct(TestStruct{Currency: "USD"})
	require.NoError(t, err)

	err = v.Struct(TestStruct{Currency: "INVALID"})
	require.Error(t, err)

}
