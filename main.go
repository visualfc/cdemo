package main

import (
	_ "unsafe"

	"github.com/goplus/llgo/c"
)

const (
	LLGoPackage = "link"
	LLGoFiles   = "wrap/wrap.c"
)

//llgo:type C
type array struct {
	x c.Int
	y c.Int
	z c.Int
	k c.Int
}

//llgo:type C
type Callback func(array) c.Int

//go:linkname demo1 C.demo1
func demo1(array) c.Int

//go:linkname demo2 C.demo2
func demo2(fn Callback) c.Int

func main() {
	n := demo1(array{1, 2, 3, 4})
	println(n)

	demo2(func(a array) c.Int {
		println("=>", a.x, a.y, a.z, a.k)
		return 100
	})
}
