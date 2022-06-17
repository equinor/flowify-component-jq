FROM alpine:3.15
RUN apk update && apk add jq

RUN addgroup -g 1000 -S flowify && \
    adduser -u 1000 -S flowify -G flowify
USER flowify
RUN mkdir -p ~/flowifydata
ENV JQ='.'
ENV INPUT=~/flowifydata/json-file.json
ENV OUTPUT=~/flowifydata/output.json
ENTRYPOINT cat $INPUT | jq $JQ > $OUTPUT