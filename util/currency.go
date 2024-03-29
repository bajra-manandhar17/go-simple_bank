package util

const (
	USD = "USD"
	EUR = "EUR"
	NPR = "NPR"
)

func IsSupportedCurrency(currency string) bool {
	switch currency {
	case USD, EUR, NPR:
		return true
	}
	return false
}
