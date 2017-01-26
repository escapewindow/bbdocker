## bbdocker
First stab at a dockerfile to test buildbot envs.

This is failing to install pycrypto and pyOpenSSL because gcc can't find -lpython2.7

I tried installing [python27-devel](ftp://ftp.pbone.net/mirror/dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/python27-devel-2.7.4-3.ius.centos6.x86_64.rpm) first, and setting `LD_LIBRARY_PATH` to `/usr/lib64` or `/tools/python/lib` but no go so far.
