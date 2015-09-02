TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG += c++11

QT += core

SOURCES += main.cpp

# mSIGNA
CONFIG(release, debug|release) {
    MSIGNA_SYSROOT = /home/bedeho/JoyStream/Development/libs/mSIGNA/sysroot
} else {
    MSIGNA_SYSROOT = /home/bedeho/JoyStream/Development/libs/mSIGNA/sysroot
}

INCLUDEPATH += $$MSIGNA_SYSROOT/include

LIBS += -L$$MSIGNA_SYSROOT/lib \
        #-lCoinDB \
        -lCoinQ \
        -lCoinCore \
        -llogger \
        -lsysutils

unix:!macx {

    LIBTORRENT_LOCAL_BUILD = /home/bedeho/JoyStream/Development/libs/libtorrent-build

    INCLUDEPATH += $$LIBTORRENT_LOCAL_BUILD/include

    # SHARED ==============================
    LIBS += -L$$LIBTORRENT_LOCAL_BUILD/lib -ltorrent-rasterbar
    DEFINES += TORRENT_DISABLE_LOGGING
    DEFINES += TORRENT_USE_OPENSSL
    DEFINES += BOOST_ASIO_HASH_MAP_BUCKETS=1021
    DEFINES += BOOST_EXCEPTION_DISABLE
    DEFINES += BOOST_ASIO_ENABLE_CANCELIO
    DEFINES += TORRENT_LINKING_SHARED
    DEFINES += TORRENT_NO_DEPRECATE

    # STATIC ==============================
    #DEFINES += TORRENT_NO_DEPRECATE
    #DEFINES += TORRENT_DISABLE_GEO_IP
    #DEFINES += BOOST_EXCEPTION_DISABLE
    #DEFINES += BOOST_ASIO_ENABLE_CANCELIO

    #CONFIG(release, debug|release) {
    #    LIBS += -L$$LIBTORRENT_LOCAL_BUILD/lib -llibtorrent-rasterbar.a
    #} else {
    #    LIBS += -L$$LIBTORRENT_LOCAL_BUILD/lib -llibtorrent-rasterbar.a
    #}
}

# openssl:
INCLUDEPATH += /usr/include/openssl

LIBS += \
        -L/usr/lib/x86_64-linux-gnu \
        -lcrypto \
        -lssl \
        -ldl

# boost:
INCLUDEPATH += /usr/include
LIBS += \
        -L/usr/lib/x86_64-linux-gnu \
        -lboost_thread \
        -lboost_system \
        -lboost_chrono \
        -lboost_random \
        -lboost_filesystem \
        -lboost_regex \
        -lpthread \
        -lz
