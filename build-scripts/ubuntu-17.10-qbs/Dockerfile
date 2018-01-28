FROM buildpack-deps:artful

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libavdevice-dev \
		libfreeimage-dev \
		libglew-dev \
		libopenal-dev \
		libsfml-dev \
		libsndfile1-dev \
		libtbb-dev \
		qtbase5-dev \
		qtdeclarative5-dev \
		qtscript5-dev \
		qttools5-dev-tools \
	; \
	rm -rf /var/lib/apt/lists/*

ENV QT_SELECT=qt5

## Build QBS
WORKDIR /tmp
RUN wget https://github.com/qbs/qbs/archive/v1.10.0.tar.gz
RUN tar zxvf v1.10.0.tar.gz
WORKDIR /tmp/qbs-1.10.0
RUN qmake -r qbs.pro \
	CONFIG+=qbs_no_dev_install  \
	CONFIG+=qbs_no_man_install  \
	CONFIG+=release CONFIG-=debug \
	QBS_INSTALL_PREFIX=/ \
	&& make -j5 \
	&& make install INSTALL_ROOT=/opt/qbs
ENV PATH="/opt/qbs/bin:${PATH}"
RUN qbs setup-toolchains --detect \
    && qbs setup-qt /usr/bin/qmake qt5 \
    && qbs config defaultProfile qt5 \
    && qbs config profiles.qt5.qbs.architecture x86_64
RUN rm -rf /tmp/qbs*

## Build libboost
WORKDIR /tmp
RUN wget https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.gz
RUN tar zxvf boost_1_66_0.tar.gz
WORKDIR /tmp/boost_1_66_0
RUN ./bootstrap.sh --prefix=/usr/local
RUN ./b2 --with=all -j8 install || exit 0
RUN rm -rf /tmp/boost*

COPY files/RxCpp/include/ /usr/local/include/

RUN mkdir -p /build/products; mkdir /source
WORKDIR /build
