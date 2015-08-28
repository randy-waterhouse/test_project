TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG += c++11

QT += core

SOURCES += main.cpp

# mSIGNA
CONFIG(release, debug|release) {
    MSIGNA_SYSROOT = /home/bedeho/JoyStream/Development/libs/mSIGNA-release/sysroot
} else {
    MSIGNA_SYSROOT = /home/bedeho/JoyStream/Development/libs/mSIGNA-debug/sysroot
}

INCLUDEPATH += $$MSIGNA_SYSROOT/include

LIBS += -L$$MSIGNA_SYSROOT/lib \
        #-lCoinDB \
        -lCoinQ \
        -lCoinCore \
        -llogger \
        -lsysutils

unix:!macx {

    #LIBTORRENT_LOCATION = /home/bedeho/JoyStream/Development/libs/$$LIBTORRENT_NAME

    #DEFINES += TORRENT_NO_DEPRECATE
    ##DEFINES += TORRENT_DISABLE_LOGGING
    ##DEFINES += TORRENT_USE_OPENSSL
    #DEFINES += TORRENT_DISABLE_GEO_IP

    # Linking
    CONFIG(release, debug|release) {

        #LIBS += -L$$LIBTORRENT_LOCATION/bin/gcc-4.8/release/address-model-64/boost-link-shared/deprecated-functions-off/link-static/threading-multi -ltorrent

        DEFINES += NDEBUG

    } else {

        # STATIC
        LIBS += -L/home/bedeho/JoyStream/Development/libs/libtorrent-rasterbar-1.0.5/bin/gcc-4.8/debug/address-model-64/boost-link-shared/deprecated-functions-off/link-static/threading-multi -ltorrent
        INCLUDEPATH += /home/bedeho/JoyStream/Development/libs/libtorrent-build/include
        DEFINES += TORRENT_NO_DEPRECATE
        DEFINES += TORRENT_DISABLE_GEO_IP

        # DYNAMIC
        #LIBS += -L/home/bedeho/JoyStream/Development/libs/libtorrent-build/lib -ltorrent-rasterbar
        #DEFINES += TORRENT_USE_OPENSSL
        #DEFINES += WITH_SHIPPED_GEOIP_H
        #DEFINES += BOOST_ASIO_HASH_MAP_BUCKETS=1021
        #DEFINES += BOOST_EXCEPTION_DISABLE
        #DEFINES += BOOST_ASIO_ENABLE_CANCELIO
        #DEFINES += BOOST_ASIO_DYN_LINK
        #DEFINES += TORRENT_LINKING_SHARED
        #INCLUDEPATH += /home/bedeho/JoyStream/Development/libs/libtorrent-build/include

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
