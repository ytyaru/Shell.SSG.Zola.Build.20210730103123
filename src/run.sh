#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# Zola 0.14.0 をビルドした。20分かかった。1.75GBいる。
# CreatedAt: 2021-07-30
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	VERSION=0.14.0
	ARC_NAME=v$VERSION.tar.gz
	DIR_NAME=zola-$VERSION
	PATH_DIR=/home/pi/root/sys/env/tool
	TO=$PATH_DIR/ssg
	Dounload() { wget https://github.com/getzola/zola/archive/refs/tags/$ARC_NAME; }
	Expand() { tar xf $ARC_NAME; }
	Build() { cd $DIR_NAME; cargo build --features search/indexing-ja; }
	Copy() { cd ..; cp ./zola-0.14.0 "$TO"; }
	Link() { ln -s $TO/$DIR_NAME/target/debug/zola $PATH_DIR/zola; }
	Dounload
	Expand
	Build
	Copy
	Link
	zola --version
}
Run "$@"
