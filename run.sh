#!/bin/bash

db() {
	docker compose -f docker-compose-db.yml up -d "$@"
}

monitor() {
	docker compose -f docker-compose-monitor.yml up -d "$@"
}

proxy() {
	docker compose -f docker-compose-proxy.yml up -d "$@"
}

if [ "$1" == "db" ]; then
	db "${@:2}"
elif [ "$1" == "monitor" ]; then
	monitor "${@:2}"
elif [ "$1" == "proxy" ]; then
	proxy "${@:2}"
fi
