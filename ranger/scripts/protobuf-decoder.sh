#!/bin/bash
set -euo pipefail

jq_output="${2:---color-output}"
if output=$(protobuf-decoder agent-metric-sample "$1" 2>/dev/null); then
  echo "${output}" | jq . "${jq_output}"
  exit 0
fi

if output=$(protobuf-decoder k8s-state "$1" 2>/dev/null); then
  echo "${output}" | jq . "${jq_output}"
  exit 0
fi

if output=$(protobuf-decoder rest "$1" 2>/dev/null); then
  echo "${output}" | jq . "${jq_output}"
  exit 0
fi

if output=$(protobuf-decoder agent-dump "$1" 2>/dev/null); then
  echo "${output}" | jq . "${jq_output}"
  exit 0
fi
