#!/bin/bash

echo "Including whitespace: `cat conway.rb | wc -c`"
echo "Excluding whitespace: `cat conway.rb | tr -d ' \t\n\r\f' | wc -c`"
