#!/bin/bash

source env.sh

cd function

zip function.zip *

aws lambda update-function-code --function-name "$LAMBDA_NAME" --zip-file fileb://function.zip

rm function.zip
