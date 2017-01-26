## bbdocker
First stab at a dockerfile to test buildbot envs.

This is failing to install pycrypto and pyOpenSSL because gcc can't find -lpython2.7

I tried installing [python27-devel](ftp://ftp.pbone.net/mirror/dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/python27-devel-2.7.4-3.ius.centos6.x86_64.rpm) first, and setting `LD_LIBRARY_PATH` to `/usr/lib64` or `/tools/python/lib` but no go so far.

Currently I'm thinking of [installing py27 from source](https://github.com/h2oai/h2o-2/wiki/installing-python-2.7-on-centos-6.3.-follow-this-sequence-exactly-for-centos-machine-only), which means we may need to pip install mercurial and virtualenv.  `/tools/python/bin/python` still needs to point to py27, but it could be a softlink or `--prefix=/tools/python27`.
