#!/bin/bash

directory=$1
extension=$2

find "$directory" -type f -name "*.$extension"
