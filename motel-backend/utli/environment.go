package utli

type Environment struct {
	Dev  string
	Pro  string
	Test string
	Path string
	Type string
}

func NewEnvironment() *Environment {
	return &Environment{
		Dev:  "development",
		Pro:  "production",
		Test: "testing",
		Path: "./envfile/",
		Type: "env",
	}
}
