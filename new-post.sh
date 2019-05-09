#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Missing required argument, post title:"
    echo "./new-post.sh \"#n // Your Movie Title\""
    echo "Last post:"
    ls -1 _posts | tail -n -1
    exit 1
fi

title="$1"
t="`echo "$title" | iconv -t ascii//TRANSLIT | sed -E 's/[~\^]+//g' | sed -E 's/[^a-zA-Z0-9]+/-/g' | sed -E 's/^-+\|-+$//g' | tr A-Z a-z`"
f="_posts/`date +'%Y-%m-%d'`-film-club$t.md"

cat > $f <<- EOM
---
layout: post
title: "Film Club $title"
author: `id -un`
---

### Pre

..

### Post

..

EOM

echo "Created new post:"
echo $f
