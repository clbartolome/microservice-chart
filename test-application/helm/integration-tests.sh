#!/bin/bash

echo "Running integration tests:"
ERRORS=0
echo "1. Validating Number of replicas"
RESULT=$(oc get deploy $1 -o template --template={{.status.availableReplicas}} -n $2)
if [ "$RESULT" -ne 1 ] 
then
  echo "-Failed: number of replicas is $RESULT, expected 1"
  ERRORS=1
fi 

echo "2. Validating Route has been creating"
oc get route $1 -o name -n $2
RESULT=$(echo $?)
if [ "$RESULT" -ne 0 ] 
then
  echo "-Failed: route does not exists"
  ERRORS=1
fi 

echo "3. Validating Environment property with /test endpoint"
ROUTE=$(oc get route $1 -o template --template='{{.spec.host}}' -n $2)
RESULT=$(curl http://$ROUTE/test)
if [ "$RESULT" != "test-message" ] 
then
  echo "-Failed: message is $RESULT, expected test-message"
  ERRORS=1
fi

echo "------------------------------------------------------"

if [ "$ERRORS" -ne 0 ] 
then
  echo "TESTS FAILED!!!!"
  echo "------------------------------------------------------"
  exit 1
fi 

echo "TESTS PASSED!!!!"
echo "------------------------------------------------------"
exit 0