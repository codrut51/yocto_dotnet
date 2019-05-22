DESCRIPTION = "Hello world program"
PR = "r0"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://${COMPANY_COMMON_LICENSE};md5=57b01037d3241a4528fb82578038cc74"

DOTNET = "https://download.visualstudio.microsoft.com/download/pr/7c130118-be9f-4e5b-89c3-97ffcfa2f45e/e156161f472b57159868c7b6225679f8/aspnetcore-runtime-2.2.4-linux-arm.tar.gz"

SRC_URI = "file://install_dotnet.sh \
           "

S = "${WORKDIR}"
INIT_D_DIR = "/etc/init.d"


inherit update-rc.d

INITSCRIPT_PACKAGES = "${PN}"

INITSCRIPT_NAME_${PN} = "install_dotnet.sh"
INITSCRIPT_PARAMS_${PN} = "defaults"

do_compile() {
    ls
}

do_install() {
    install -d ${D}${INIT_D_DIR}
    install -m 0755 ${S}/install_dotnet.sh ${D}${INIT_D_DIR}/
}