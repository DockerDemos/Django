# Django Docker container

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV DJANGO_VERSION 1.7.2
ENV DJANGO https://www.djangoproject.com/download/$DJANGO_VERSION/tarball/
ENV PKGS curl tar python-setuptools

RUN yum install -y --nogpgcheck $PKGS
RUN curl -sSL $DJANGO -o django-${DJANGO_VERSION}.tar.gz && \
    tar -xvzf django-${DJANGO_VERSION}.tar.gz --strip-components=1 -C /tmp
WORKDIR /tmp
RUN python setup.py install && python -c "import django; print(django.get_version())"

EXPOSE 80
EXPOSE 443
