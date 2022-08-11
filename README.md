# sort maildir into subfolders by date

Prequesites:
    * bash, find, sed
    * maidirmake (for example from the courier package)
    * python3 with email.utils library

This folder contains scripts to sort a maildir into subfolders my year/month.

Scripts assume the old maildir to be in the path of the scripts and working
directory to be the folder where the scripts are.

Invoke by calling `./run.sh` with the old maildir as first and the target
directory as the second argument.

You can monitor progress by counting the files in the old and the new directory
for example with:

```
watch -n 10 'find newMaildir -type f -printf '.' | wc -m'
```

This takes some time, for my archive of ~140000 mails this runs for about one
and a half hours.

The resulting maildir should be usable by imap servers and some mail clients
(maildir support seems to not work to well, thunderbird still consideres this
experimental, kmail does not support subfolders, ...) and most imap servers. So
you can for example run a local dovecot to store your mail archive, index it for
searching, ... and access it over IMAP with the mail client(s) of your choice.
