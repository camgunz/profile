for x in *.vgz; do FN="${x}"; NFN=`basename "$FN" .vgz`.vgm; gunzip -c "$FN" > "$NFN"; done
