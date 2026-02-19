
do_install:prepend() {
    install -d ${D}${sysconfdir}/default
    install -m 0755 ${UNPACKDIR}/config ${D}${sysconfdir}/default/transmission-daemon

    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
        install -d ${D}${sysconfdir}/init.d
        install -m 0755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/transmission-daemon
    fi

    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${UNPACKDIR}/service ${D}${systemd_unitdir}/system/transmission-daemon.service
    fi
}

FILES:${PN} += "${sysconfdir}"
CONFFILES:${PN} = "${sysconfdir}/default/transmission-daemon"
