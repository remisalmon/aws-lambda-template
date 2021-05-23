#!/usr/bin/bash

source env

cd function

zip -r function.zip .

aws lambda update-function-code --function-name "$LAMBDA_NAME" \
                                --zip-file fileb://function.zip

rm function.zip
