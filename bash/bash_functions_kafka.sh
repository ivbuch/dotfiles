.kafka_consume_topic() {
  topic=${1:-test}
  echo Consuming topic $topic
  kafkacat -C  -t $topic -f 'Message-Key: %k\nPayload-Length: %S\nOffset: %o\n\n\n' 
}

.kafka_consume_topic_decoder() {
  topic=${1:-test}
  offset=${2:-end}
  echo Consuming topic $topic
  kafkacat -C  -t $topic -o $offset -f '%t\n%p\n%o\n%R%s\n\n\n\n\n' | kafkacat-decoder
}
