for txtfile in $(ls data-hold/*.TXT); do cat $txtfile | sort -nrt ',' -k 5 | head -n 1; done;
