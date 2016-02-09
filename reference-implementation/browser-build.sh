#!/bin/bash

# Going with commonjs module loading to make everything a single big blob

# Gecko currently has trouble with:
# - default values in destructuring: https://bugzilla.mozilla.org/show_bug.cgi?id=932080 (leads to destructuring and parameters)
# - for (const blah of otherBlah) ... (leads to block-scoping)
node_modules/.bin/browserify index.js -s Streams -o streams.js -t [ babelify --plugins [ transform-es2015-modules-commonjs transform-es2015-destructuring transform-es2015-parameters transform-es2015-block-scoping ] ]
