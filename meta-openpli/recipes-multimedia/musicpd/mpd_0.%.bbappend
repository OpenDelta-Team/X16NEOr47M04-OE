FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

DEPENDS:remove = "boost"

SRC_URI += " \
        file://mpd.conf \
        file://mpd.init \
        "

do_install:append() {
    install -d ${D}${localstatedir}/lib/mpd/playlists
    install -d ${D}${sysconfdir}/init.d
    install -m 755 ${UNPACKDIR}/mpd.init ${D}${sysconfdir}/init.d/mpd
    install -m 644 ${UNPACKDIR}/mpd.conf ${D}${sysconfdir}/mpd.conf
}
