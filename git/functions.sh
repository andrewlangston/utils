#!/bin/sh

# Delete all local branches except master & any passed as arguments
clear_local_branches() {
  for b in $(git branch | egrep -v "master $@"); do
    git branch -D $b
  done
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

push_current() {
  git push "$@" origin "$(parse_git_branch)"
}
