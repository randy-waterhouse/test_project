TEMPLATE = app
CONFIG  += console
CONFIG  -= app_bundle
CONFIG  -= qt
CONFIG  += link_pkgconfig

QT      += core

QMAKE_CXXFLAGS += -std=c++11

SOURCES += main.cpp

PKGCONFIG += libtorrent-rasterbar

# mSIGNA
CONFIG(release, debug|release) {
    MSIGNA_SYSROOT = /home/kiwigb/bitcoin-dev/mSIGNA-dev/sysroot
} else {
    MSIGNA_SYSROOT = /home/kiwigb/bitcoin-dev/mSIGNA-dev/sysroot
}

INCLUDEPATH += $$MSIGNA_SYSROOT/include

LIBS += -L$$MSIGNA_SYSROOT/lib \
        #-lCoinDB \
        -lCoinQ \
        -lCoinCore \
        -llogger \
        -lsysutils

## openssl:
INCLUDEPATH += /usr/include/openssl

LIBS += \
        -L/lib64 \
        -lcrypto \
#        -lssl \
#        -ldl
        -lboost_filesystem \
        -lboost_regex \
        -lboost_thread \
        -lpthread
