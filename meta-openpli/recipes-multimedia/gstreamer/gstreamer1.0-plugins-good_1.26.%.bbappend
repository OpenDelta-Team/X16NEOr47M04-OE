FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

PV = "1.28.2"

SRC_URI[sha256sum] = "1ace2d8ec74f632d82eab5006753a27fe0c2402db4ca94d63271e494b62f50bf"

DEPENDS:append = " libsoup-2.4"
RDEPENDS:${PN}-soup += "libsoup-2.4"

SRC_URI:append = " file://001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"

PACKAGECONFIG = "${GSTREAMER_ORC} amrnb amrwb bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng \
                 mpg123 soup2 speex taglib v4l2 vpx wavpack \
"
