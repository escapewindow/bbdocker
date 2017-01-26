#!/bin/sh -x

wget http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/pyOpenSSL-0.10.tar.gz
tar zxvf pyOpenSSL-0.10.tar.gz
cd pyOpenSSL-0.10
/tools/python/bin/python setup.py build
/tools/python/bin/python setup.py install
/tools/python/bin/python setup.py install
cd ..
rm -rf pyOpenSSL-0.10 pyOpenSSL-0.10.tar.gz

wget http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/pycrypto-2.3.tar.gz
tar zxvf pycrypto-3.4.tar.gz
cd pycrypto-3.4
/tools/python/bin/python setup.py build
/tools/python/bin/python setup.py install
/tools/python/bin/python setup.py install
cd ..
rm -rf pycrypto-3.4 pycrypto-3.4.tar.gz
