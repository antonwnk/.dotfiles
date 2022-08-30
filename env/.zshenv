path+=("/usr/local/go/bin" )

export GOPATH=$(go env GOPATH)

path+=("$GOPATH/bin")
export PATH
