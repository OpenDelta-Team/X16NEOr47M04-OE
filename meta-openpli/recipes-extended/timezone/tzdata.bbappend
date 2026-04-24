do_compile () {
        oe_runmake -C ${S} tzdata.zi
        for zone in ${TZONES}; do \
            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${B}/zoneinfo -L /dev/null ${S}/${zone}
                -y ${S}/yearistype.sh ${S}/${zone} ; \
        done
}

TZONES:remove = "systemv"

TZ_PACKAGES:remove = "tzdata-right"

RPROVIDES:tzdata-right:remove = "tzdata-right"

DEFAULT_TIMEZONE = "Europe/Amsterdam"

PACKAGES += "${PN}-base"

FILES:${PN}-base = "${datadir}/zoneinfo"
