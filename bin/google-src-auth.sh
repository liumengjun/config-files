#!/bin/bash
touch ~/.gitcookies
chmod 0600 ~/.gitcookies

git config --global http.cookiefile ~/.gitcookies

tr , \\t <<\__END__ >>~/.gitcookies
android.googlesource.com,FALSE,/,TRUE,2147483647,o,git-Mengjun18.gmail.com=1/X9sZ-q-Xlhi_edcGrd4u3-TGggb-CAGF9v40vf4nDbk
android-review.googlesource.com,FALSE,/,TRUE,2147483647,o,git-Mengjun18.gmail.com=1/X9sZ-q-Xlhi_edcGrd4u3-TGggb-CAGF9v40vf4nDbk
__END__

