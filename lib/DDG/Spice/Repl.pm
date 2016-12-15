package DDG::Spice::Repl;

use DDG::Spice;
use strict;
use warnings;

spice is_cached => 1;
spice proxy_cache_valid => '200 1d'; # defaults to this automatically

spice wrap_jsonp_callback => 0;

spice from => '([^/]+)(?:/(.*))?';
spice to => 'https://eval.repl.it/eval';
spice post_body => 'language=$1&code=$2';
spice headers => {
    basic_auth => ['ddg','duckit']
};

triggers end => 'repl';

my @langs = qw(
    apl
    bloop
    brainf
    c
    csharp
    cpp
    cpp11
    coffeescript
    emoticon
    babel
    fsharp
    forth
    go
    java
    javascript
    jest
    lolcode
    lua
    nodejs
    php
    python
    python_turtle
    python3
    qbasic
    roy
    ruby
    rust
    scheme
    swift
    unlambda
    web_project
);

my %aliases = (
    'brain fuck' => 'brainf',
    'brainfuck' => 'brainf',
    'c#' => 'csharp',
    'c++' => 'cpp',
    'c++11' => 'cpp11',
    'coffee script' => 'coffeescript',
    'css' => 'web_project',
    'es6' => 'babel',
    'f#' => 'fsharp',
    'html' => 'web_project',
    'java script' => 'javascript',
    'javascript es6' => 'babel',
    'js es6' => 'babel',
    'js' => 'javascript',
    'node.js' => 'nodejs',
    'node' => 'nodejs',
    'python 2' => 'python',
    'python 3' => 'python3',
    'python turtle' => 'python_turtle',
    'python with turtle' => 'python_turtle',
    'python2' => 'python'
);

handle remainder => sub {

    return unless $_;
    return $_, "2+3" if $_ ~~ @langs;
    return $aliases{$_}, "2+3" if exists $aliases{$_};
};

1;
