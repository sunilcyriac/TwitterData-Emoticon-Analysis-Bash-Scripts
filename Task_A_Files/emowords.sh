#!/bin/bash
#This code is for reading the msgraw_sample.txt file as stdin and passed to the python file then code is executed as per the for loop


#Code starts here


#for loop takes each emoji as variable to E and passed to the parameter $E and taking the stdin file emoword.py is executed and the words co-occuring with each emoticons are generated then later filtered properly

for E in  ':)' ':D' ':p' ':(' ';)' '-_-' '<3' ':*' '(^o^)' '(^^)' ':3' ':-)' ':/' 'xD' '*-*' ":'(" 'D:' '-.-' '=)' '(>_<)'  ; do
	echo running this emoticon $E >> emowordresult.txt
	./emoword.py  $E < msgraw_sample.txt | sed -E 's/(a|about|above|after|again|against|all|am|an|and|any|are|as|at|be|because|been|before|being|below|between|both|but|by|could|did|do|does|doing|down|during|each|few|for|from|further|had|has|have|having|he|he’d|he’ll|he’s|her|here|here’s|hers|herself|him|himself|his|how|how’s|I|I’d|I’ll|I’m|I’ve|if|in|into|is|it|it’s|its|itself|let’s|me|more|most|my|myself|nor|of|on|once|only|or|other|ought|our|ours|ourselves|out|over|own|same|she|she’d|she’ll|she’s|should|so|some|such|than|that|that’s|the|their|theirs|them|themselves|then|there|there’s|these|they|they’d|they’ll|they’re|they’ve|this|those|through|to|too|under|until|up|very|was|we|we’d|we’ll|we’re|we’ve|were|what|what’s|when|when’s|where|where’s|which|while|who|who’s|whom|why|why’s|with|would|you|you’d|you’ll|you’re|you’ve|your|yours|yourself|yourselves|RT)//gI' | grep -e '^[A-Za-z]' | sort | uniq -c | sort -nr | perl -p -e 's/^\s+//; s/ /\t/; ' >> emowordresult.txt
done


#code ends here
