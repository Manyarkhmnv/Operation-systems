#!/bin/bash

./6handler.sh &
handler_pid=$!

./6generator.sh $handler_pid

wait $handler_pid
