# vim: ft=sh
echo "Is the following rm really necessary?"
rm -f notes/.index notes/.last-run

out_dir=${rn_root}test/notes

rm -Rf $out_dir


# mkdir out

../scripts/create-html.pl

cp -f ../res/notes.css ../res/q.js $out_dir

# TODO: copy files to webserver directory

rm $out_dir/.index

# 2018-02-16: use diff -Z instead... find $out_dir -type f -not -name '*.svg' | xargs unix2dos -q

diff -rqZ $out_dir expected
