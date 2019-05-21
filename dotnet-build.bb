DESCRIPTION = "Hello world program"
PR = "r0"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${COMPANY_COMMON_LICENSE};md5=57b01037d3241a4528fb82578038cc74"

DOTNET = "https://download.visualstudio.microsoft.com/download/pr/7c130118-be9f-4e5b-89c3-97ffcfa2f45e/e156161f472b57159868c7b6225679f8/aspnetcore-runtime-2.2.4-linux-arm.tar.gz"

SRC_URI = "file://configure-dotnet.service \
           file://install_dotnet.sh \
           file://Makefile \
"

S = "${WORKDIR}"

do_compile() {
    wget ${DOTNET}
}

do_install() {
    install -d ${D}${datadir}/download/
    install -d ${D}${sbindir}/   
    install -d ${D}${systemd_unitdir}/system/
    install -m 0644 ${S}/aspnetcore-runtime-2.2.4-linux-arm.tar.gz ${D}${datadir}/download/
    install -m 0755 ${S}/configure-dotnet.service ${D}${systemd_unitdir}/system/
    install -m 0644 ${S}/Makefile ${D}${sbindir}/
    install -m 0755 ${S}/install_dotnet.sh ${D}${sbindir}/
}


FILES_${PN} = "\
    ${datadir}/* \
    ${datadir}/download/ \
    ${datadir}/download/* \
    ${systemd_unitdir}/system/ \
    ${systemd_unitdir}/system/* \
    ${sbindir}/ \
    ${sbindir}/* \
"

NATIVE_SYSTEMD_SUPPORT = "1"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "configure-dotnet.service"
