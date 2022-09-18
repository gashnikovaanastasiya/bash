#!/bin/bash

script=$(readlink -f $0)
readlink -f $0
basename $script
