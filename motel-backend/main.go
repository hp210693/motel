package main

type List[T any] struct {
	next *List[T]
	val  T
}

func main() {
	list := List{1}
}
