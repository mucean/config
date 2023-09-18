#!/bin/sh

go env -w GOPROXY=https://goproxy.cn/
go env -w CGO_ENABLED=0
go env -w GOPATH=$HOME/data/gopath
