FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bsp.cfg \
                   file://0001-misc-xlnx_dpu-support-softmax-40bit-addressing-from-.patch \
"
KERNEL_FEATURES:append = " bsp.cfg"
SRC_URI += "file://user_2024-05-17-03-28-00.cfg \
            file://user_2024-05-17-19-55-00.cfg \
            "

