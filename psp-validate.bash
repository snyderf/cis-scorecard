#!/usr/bin/env bash
name=$(kubectl get psp | awk '{print $1}')
result="fail"
for n in $name; do
    if [[ $n == "NAME" ]]
    then
        continue
    fi
    hostPID=$(kubectl get psp $n -o=jsonpath='{.spec.hostPID}')
    if [ -z $hostPID ]
    then
        result="pass"
    fi
done
echo $result