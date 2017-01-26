FROM centos:6

# Install RPMs
COPY yum/. /etc/yum.repos.d/
RUN yum -y install \
    gcc \
    libffi-devel \
    mozilla-python27-mercurial \
    mozilla-python27-virtualenv \
    mysql-devel \
    wget

# Create /tools/python link, /builds
RUN ln -s /tools/python27 /tools/python
RUN ln -s /tools/python/lib/libpython2.7.so /tools/python/lib/python2.7.so

WORKDIR /builds

# grr pyOpenSSL
COPY force_pyopenssl.sh /builds/
RUN sh force_pyopenssl.sh

# Install pip, then pip install
RUN wget http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/setuptools-1.3.tar.gz \
    && tar zxvf setuptools-1.3.tar.gz \
    && (cd setuptools-1.3; /tools/python/bin/python setup.py install) \
    && rm -rf setuptools-1.3.tar.gz setuptools-1.3
RUN wget http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/pip-1.5.5.tar.gz \
    && tar zxvf pip-1.5.5.tar.gz \
    && (cd pip-1.5.5; /tools/python/bin/python setup.py install) \
    && rm -rf pip-1.5.5.tar.gz pip-1.5.5

RUN /tools/python/bin/pip install \
    SQLAlchemy==0.6.4 \
    http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/Twisted-10.2.0.tar.gz \
    http://releng-puppet1.srv.releng.use1.mozilla.com/python/packages/buildbot-0.8.4-pre-moz11.tar.gz

# Copy files into the container.  You will have to clone braindump, buildbot-configs,
# buildbotcustom, and tools in .
COPY bashrc /root/.bashrc
COPY braindump /builds/braindump
COPY buildbot-configs /builds/buildbot-configs
COPY buildbotcustom /builds/buildbotcustom
COPY tools /builds/tools
