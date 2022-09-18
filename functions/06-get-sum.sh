#!/bin/bash

mult=1
for i do
sum=$(expr $sum + $i)
(( mult *= $i ))
done
echo "Sum: $sum"
echo "Prod: $mult"
