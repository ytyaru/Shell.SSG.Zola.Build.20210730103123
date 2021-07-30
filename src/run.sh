#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# Zola 0.14.0 をビルドした。20分かかった。1.75GBいる。
# CreatedAt: 2021-07-30
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	Dounload() { wget https://github.com/getzola/zola/archive/refs/tags/v0.14.0.tar.gz; }
	Expand() { tar xf v0.14.0.tar.gz; }
	Build() { cd zola-0.14.0; cargo build --features search/indexing-ja; }
	Dounload
	Expand
	Build
}
Run "$@"
