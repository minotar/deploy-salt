export GOPATH=/home/minotar/go
go get github.com/minotar/minotar
go install github.com/minotar/minotar
cp -r $GOPATH/src/github.com/minotar/minotar/www $GOPATH/bin

