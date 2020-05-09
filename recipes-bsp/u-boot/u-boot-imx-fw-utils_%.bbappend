FILESEXTRAPATHS_prepend := "${THISDIR}/compulab/imx8mq:${THISDIR}/${PN}:"

include compulab/imx8mq.inc

UBOOT_SRC = "git://source.codeaurora.org/external/imx/uboot-imx.git;protocol=https"
SRCBRANCH = "imx_v2019.04_5.4.3_2.0.0"
SRC_URI = "${UBOOT_SRC};branch=${SRCBRANCH} \
"
SRCREV = "47c19229783cd51821d1cc13bedb0dd5850f00da"

SRC_URI =+ " file://fw_env.config"

RPROVIDES_${PN} += "u-boot-fw-utils"
