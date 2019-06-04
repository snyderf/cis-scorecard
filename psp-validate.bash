#!/usr/bin/env bash
name=$(kubectl get psp | awk '{print $1}')
result1="fail"
result2="fail"
result3="fail"
result4="fail"
for n in $name; do
    if [[ $n == "NAME" ]]
    then
        continue
    fi
    hostPID=$(kubectl get psp $n -o=jsonpath='{.spec.hostPID}')
    if [ -z $hostPID ]
    then
        result1="pass"
    fi
    hostIPC=$(kubectl get psp $n -o=jsonpath='{.spec.hostIPC}')
    if [ -z $hostIPC ]
    then
        result2="pass"
    fi
    hostNetwork=$(kubectl get psp $n -o=jsonpath='{.spec.hostNetwork}')
    if [ -z $hostNetwork ]
    then
        result3="pass"
    fi
    hostallowPrivilegeEscalation=$(kubectl get psp $n -o=jsonpath='{.spec.hostallowPrivilegeEscalation}')
    if [ -z $hostallowPrivilegeEscalation ]
    then
        result4="pass"
    fi
    
done
echo "1.7.2 Do not admit containers wishing to share the host process ID namespace: $result1"
echo "1.7.3 Do not admit containers wishing to share the host IPC namespace: $result2"
echo "1.7.4 Do not admit containers wishing to share the host network namespace: $result3"
echo "1.7.5 Do not admit containers with allowPrivilegeEscalation: $result4"