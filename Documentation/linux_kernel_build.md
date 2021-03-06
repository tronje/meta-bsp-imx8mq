# CL-SOM-iMX8 Linux Kernel Building

Supported machines:

* `cl-som-imx8`

Define a `MACHINE` environment variable with respect to a required machine:
<pre>
export MACHINE=cl-som-imx8
</pre>

## Prerequisites
It is up to developer to setup arm64 build environment:
* Download a tool chain from [Linaro](https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/aarch64-linux-gnu/)
* Set environment variables:
<pre>
export ARCH=arm64
export CROSS_COMPILE=/usr/bin/aarch64-linux-gnu-
</pre>
* Create a folder to organize the files:
<pre>
mkdir imx8mq
cd imx8mq
</pre>
* Download CompuLab BSP
<pre>
git clone -b master https://github.com/compulab-yokneam/meta-bsp-imx8mq.git
export PATCHES=$(pwd)/meta-bsp-imx8mq/recipes-kernel/linux/compulab/imx8mq
</pre>

# CompuLab Linux Kernel setup
<pre>
git clone https://source.codeaurora.org/external/imx/linux-imx.git
git -C linux-imx checkout -b linux-compulab rel_imx_4.14.98_2.0.0_ga
git -C linux-imx am ${PATCHES}/*.patch
</pre>

# Compile the Kernel
<pre>
make -C linux-imx ${MACHINE}_defconfig
make -C linux-imx
</pre>
