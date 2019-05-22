FILESEXTRAPATHS_prepend := "${THISDIR}/systemd:"

do_package_append() {
    
}
NATIVE_SYSTEMD_SUPPORT = "1"
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "configure-dotnet.service"
inherit systemd