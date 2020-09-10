#!/bin/bash

source env.sh

cd layer

mkdir volume

docker build -t "$LAMBDA_NAME" .

docker run --rm -v $(pwd)/volume:/volume:z "$LAMBDA_NAME"

aws lambda publish-layer-version --layer-name "$LAMBDA_NAME"-layer \
                                 --description "python3.6 layer for $LAMBDA_NAME" \
                                 --compatible-runtimes python3.6 \
                                 --zip-file fileb://volume/layer.zip | tee json

#aws lambda update-function-configuration --function-name "$LAMBDA_NAME" \
#                                         --layers $(jq -r '.LayerVersionArn' json)

rm -rf volume json
