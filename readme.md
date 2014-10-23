### JSHint Config with comments
```js
{
  // JSHint Default Config except few options and little cleanup
  // See http://jshint.com/docs/ for more details

  "maxerr"        : 10,       // {int} Maximum error before stopping

  // Enforcing
  "bitwise"       : false,    // true: Prohibit bitwise operators (&, |, ^, etc.)
  "camelcase"     : false,    // true: Identifiers must be in camelCase
  "curly"         : true,     // true: Require {} for every new block or scope
  "eqeqeq"        : false,    // true: Require triple equals (===) for comparison
  "forin"         : false,    // true: Require filtering for..in loops with obj.hasOwnProperty()
  "immed"         : false,    // true: Require immediate invocations to be wrapped in parens e.g. `(function () { } ());`
  "indent"        : 2,        // {int} Number of spaces to use for indentation
  "latedef"       : false,    // true: Require variables/functions to be defined before being used
  "newcap"        : true,     // true: Require capitalization of all constructor functions e.g. `new F()`
  "noarg"         : true,     // true: Prohibit use of `arguments.caller` and `arguments.callee`
  "noempty"       : true,     // true: Prohibit use of empty blocks
  "nonew"         : false,    // true: Prohibit use of constructors for side-effects (without assignment)
  "plusplus"      : false,    // true: Prohibit use of `++` & `--`
  "quotmark"      : "single",
  "undef"         : true,     // true: Require all non-global variables to be declared (prevents global leaks)
  "unused"        : true,     // true: Require all defined variables be used
  "strict"        : false,    // true: Requires all functions run in ES5 Strict Mode
  "maxparams"     : 3,        // {int} Max number of formal params allowed per function
  "maxdepth"      : 3,        // {int} Max depth of nested blocks (within functions)
  "maxstatements" : false,    // {int} Max number statements per function
  "maxcomplexity" : false,    // {int} Max cyclomatic complexity per function
  "maxlen"        : false,    // {int} Max number of characters per line

  // Relaxing
  "asi"           : true,     // true: Tolerate Automatic Semicolon Insertion (no semicolons)
  "boss"          : false,    // true: Tolerate assignments where comparisons would be expected
  "debug"         : false,    // true: Allow debugger statements e.g. browser breakpoints.
  "eqnull"        : true,     // true: Tolerate use of `== null`
  "esnext"        : true,     // true: Allow ES.next (ES6) syntax (ex: `const`)
  "evil"          : false,    // true: Tolerate use of `eval` and `new Function()`
  "expr"          : true,     // true: Tolerate `ExpressionStatement` as Programs
  "funcscope"     : true,     // true: Tolerate defining variables inside control statements
  "globalstrict"  : true,     // true: Allow global "use strict" (also enables 'strict')
  "iterator"      : false,    // true: Tolerate using the `__iterator__` property
  "lastsemic"     : true,     // true: Tolerate omitting a semicolon for the last statement of a 1-line block
  "laxbreak"      : true,     // true: Tolerate possibly unsafe line breakings
  "laxcomma"      : false,    // true: Tolerate comma-first style coding
  "loopfunc"      : false,    // true: Tolerate functions being defined in loops
  "multistr"      : false,    // true: Tolerate multi-line strings
  "proto"         : false,    // true: Tolerate using the `__proto__` property
  "scripturl"     : false,    // true: Tolerate script-targeted URLs
  "shadow"        : true,     // true: Allows re-define variables later in code e.g. `var x=1; x=2;`
  "sub"           : true,     // true: Tolerate using `[]` notation when it can still be expressed in dot notation
  "supernew"      : true,     // true: Tolerate `new function () { ... };` and `new Object;`
  "validthis"     : true,     // true: Tolerate using this in a non-constructor function

  // Environments
  "browser"       : true,     // Web Browser (window, document, etc)
  "browserify"    : true,     // Browserify (node.js code in the browser)
  "devel"         : true,     // Development/debugging (alert, confirm, etc)
  "node"          : true,    // Node.js
  "nonstandard"   : true,    // Widely adopted globals (escape, unescape, etc)

    // Custom Globals
  "globals": {
    "it": true,
    "describe": true,
    "beforeEach": true,
    "afterEach": true,
    "define": true,
    "should": true
  }
}

```
