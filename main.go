package main

import (
	"time"

	"github.com/sirupsen/logrus"
)

var (
	buildTime string
	gitHash   string
)

var log = logrus.WithField("ctx", "main")

func main() {
	logrus.SetFormatter(&logrus.JSONFormatter{
		TimestampFormat: time.RFC3339Nano,
	})


	ticker := time.NewTicker(10 * time.Second)
	doLog()
	for range ticker.C {
		doLog()
	}
}

func doLog() {
	log.Info("This is an INFO message")
	log.Warn("This is a WARN message")
	log.Error("This is an ERROR message")
}
