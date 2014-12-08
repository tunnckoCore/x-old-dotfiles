var braces = require('braces')
var endsWith = require('ends-with')
var startsWith = require('starts-with')
var chars = require('regexp-special-chars')

module.exports = function micromatch(str, pattern) {
  if (endsWith(pattern, '**') || endsWith(pattern, '**/')) {
    return new SyntaxError('invalid syntax `' + pattern + '`');
  }

  needle = braces(pattern)

  // needle = needle.filter(function(item) {
  //   return isNegate(pattern) ? item.slice(1) : item;
  // }).map(function(item) {
  //   return esc(item);
  // });
  if (isNegate(pattern)) {
    needle = needle.map(function(item) {
      return esc(item.slice(1));
    });
  } else {
    needle = needle.map(function(item) {
      return esc(item);
    });
  }

  needle = '(?:' + needle.join('|') + ')';
  needle = needle.replace(/\\\/\\\*\\\*/g, '/(?:.+?)');
  needle = needle.replace(/\\\*/g, '(?:.+?)');

  if (isNegate(pattern)) {
    needle = '(?!^' + needle + ')';
    //console.log(needle)
    var matches = str.match(needle);
    return matches.index === 0 ? true : false;
  }

  needle = new RegExp('^' + needle + '$');
  //console.log(needle)
  return needle.test(str)
}

function isNegate(str) {
  return startsWith(str, '!');
}

function esc(str) {
  return str.replace(chars, '\\$&');
}
