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

    INCLUDEPATH += /usr/local/include
    LIBS += -L/usr/local/lib -ltorrent-rasterbar

    DEFINES += TORRENT_DISABLE_LOGGING
    DEFINES += TORRENT_USE_OPENSSL
    DEFINES += BOOST_ASIO_HASH_MAP_BUCKETS=1021
    DEFINES += BOOST_EXCEPTION_DISABLE
    DEFINES += BOOST_ASIO_ENABLE_CANCELIO
    DEFINES += TORRENT_LINKING_SHARED

    # Linking
    CONFIG(release, debug|release) {
        DEFINES += NDEBUG

    } else {
        DEFINES += TORRENT_DEBUG
    }
}

# openssl
OPENSSL_LOCATION = /usr/local/ssl

INCLUDEPATH += $$OPENSSL_LOCATION/include

LIBS += -L$$OPENSSL_LOCATION/lib \
        -lcrypto \
        -lssl \
        -ldl

# boost
INCLUDEPATH += /usr/local/include
LIBS += \
     -L/usr/local/lib \
     -lboost_thread \
     -lboost_system \
     -lboost_filesystem \
     -lboost_regex \
     -lpthread \
     -lz
