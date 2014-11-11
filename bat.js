function escapeJSON(data) {
  return encodeURIComponent(JSON.stringify(data))
}

console.log(escapeJSON(['tunnckocore', 'tjholowaychuk']))
console.log(escapeJSON(['tunnckocore', 'tjholowaychuk', {}]))

{
  "rows": [
    {"key":["tunnckocore","koa-better-body"],"value":1},
    {"key":["tunnckocore","koa-better-ratelimit"],"value":1},
    {"key":["tunnckocore","npmls"],"value":1},
  ]
}
