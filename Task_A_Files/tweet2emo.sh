#!/bin/bash
#tweet CSV file "msgraw_sample.txt" as input. This is hardcoded in the script input section
#This is tweet2emo.sh file used to generate the potentialemoticon.csv file


#Code starts here

#The following code do these steps 1. cut only the text part of tweet from file 2. convert embedded html to original form 3. convert space to newline characters 4.sort the file and store to an intermediate file
cut -f1 < msgraw_sample.txt | perl -p -e 's/&gt;/>/g; s/&lt;/</g;' | perl -p -e 's/\s+/\n/g;'| sort > intermdediateFile1.csv



#The following code do these steps 1. remove blank lines only 2.Filter the lines to closely related characters for emoji 3. Filter the lines within the length of >1 and <8 and store to intermdediate file
grep . intermdediateFile1.csv | sed 's/[ACEFGHIJLKMNQRSTUWYabcdefghijklmnrsqtuwy1245670]*//g' | awk 'length($0)>1 && length($0)<8' > intermdediateFile2.csv



#The following code do these steps 1. Filter the records which starts from the most closely related characters of start for an emoticon 2. Delete empty lines if any 3. sort 4. take count 5. make tab delimited 4. sort in descending order for count  and store to potential_emoticon.csv file
grep -E '^[:;=^<>(_*xXD0O8vVD\-]' intermdediateFile2.csv | sed '/^\s*$/d' | sort | uniq -c | perl -p -e 's/^\s+//; s/ /\t/; ' | sort -t$'\t' -k1 -nr > potential_emoticon.csv


#code ends here




