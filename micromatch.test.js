var micromatch = require('./micromatch')

describe('micromatch', function() {
  it('should match `*.foo` pattern', function(done) {
    micromatch('bar.foo', '*.foo').should.equal(true);
    done();
  });
  it('should match `*.{js,txt}` pattern', function(done) {
    micromatch('bar.js', '*.{js,txt}').should.equal(true);
    micromatch('bar.txt', '*.{js,txt}').should.equal(true);
    micromatch('client/api/index.js', 'client/api/*.js').should.equal(true);
    done();
  });
  it('should match globstar patterns `a/**/b` or `api/**/*.js`', function(done) {
    micromatch('a/x/y/b', 'a/**/b').should.equal(true);
    micromatch('client/api/test/fixtures/strip.js', 'client/api/**/*.js').should.equal(true);
    micromatch('client/api/test/index.js', 'client/api/**/*.js').should.equal(true);
    micromatch('client/api/nested/path/.gitignore', 'client/**/*').should.equal(true);
    done();
  });
  it('should not match if not strict', function(done) {
    micromatch('abc/cde/efg.txt', 'abc/*/efg').should.equal(false);
    micromatch('test/beta/index.js', 'test/**/index').should.equal(false);
    micromatch('abc/foo.js', 'abc/bar.js').should.equal(false);
    done();
  });
  it('should work with negates', function(done) {
    micromatch('client/api/home.js', '!client/api/*.v3.js').should.equal(true);
    micromatch('client/api/home.js', '!client/api/home.js').should.equal(false);
    micromatch('client/api/test/index.js', '!client/api/**/*.js').should.equal(false);

    micromatch('data/fixtures/api/home.js', '!client/api/*.v3.js').should.equal(true);
    micromatch('data/fixtures/api/home.js', '!client/api/home.js').should.equal(true);
    micromatch('data/fixtures/api/test/index.js', '!client/api/**/*.js').should.equal(true);
    done();
  });
  it('should throw SyntaxError if ends with `**` or `**/`', function(done) {
    micromatch('data/test/index.js', 'data/**').should.throw();
    micromatch('data/test/index.js', 'data/**/').should.throw();
    micromatch('data/test/index.js', 'data/**/*').should.equal(true);
    done();
  });
  it('should work with globstars + brace expansions', function(done) {
    micromatch('data/test/foo.js', 'data/**/{foo,bar}').should.equal(false);
    micromatch('data/test/foo.js', 'data/**/{foo,bar}.js').should.equal(true);
    micromatch('data/test/bar.js', 'data/**/{foo,bar}.js').should.equal(true);
    micromatch('foo/a/baz.js', 'foo/{a..d}/{bar,baz}.js').should.equal(true);
    micromatch('foo/b/baz.qux.js', 'foo/{a..d}/{bar,baz}.*.test.js').should.equal(false);
    micromatch('foo/b/baz.qux.test.js', 'foo/{a..d}/{bar,baz}.*.test.js').should.equal(true);
    micromatch('foo/c/daf/2.js', 'foo/{a..d}/**/{1..3}.js').should.equal(true);
    micromatch('foo/c/baf/3.js', 'foo/{a..d}/**/{1..3}.js').should.equal(true);
    micromatch('foo/invalid/baf/5.js', 'foo/{a..d}/**/{1..3}.js').should.equal(false);
    done();
  });
  it('should work with brace expansions only', function(done) {
    micromatch('foo/1', 'foo/{1..3}').should.equal(true);
    micromatch('foo/2', 'foo/{1..3}').should.equal(true);
    micromatch('foo/3', 'foo/{1..3}').should.equal(true);
    micromatch('foo/2.test.js', 'foo/{1..3}.{test,v3}.{js,coffee}').should.equal(true);
    micromatch('foo/2.v3.js', 'foo/{1..3}.{test,v3}.{js,coffee}').should.equal(true);
    micromatch('foo/3.test.coffee', 'foo/{1..3}.{test,v3}.{js,coffee}').should.equal(true);
    done();
  });
});
