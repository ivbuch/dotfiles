.kafka_consume_topic() {
  topic=${1:-test}
  echo Consuming topic $topic
  kafkacat -C  -t $topic -f 'Message-Key: %k\nPayload-Length: %S\nOffset: %o\n\n\n' 
}

