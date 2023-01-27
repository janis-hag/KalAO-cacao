![KalAO](.kalao_logo.png?raw=true "Title")
# Launching CACAO on KalAO

The hardwarelaunch script is used to configure all the CACAO setup for KalAO using the configurations in

- **cacao-loop-deploy KalAO-dmloop**: to deploy the main AO loop
- **cacao-loop-deploy KalAO-ttmloop**: to deploy the Tip/Tilt offloading loop
- **[kalaohardware-conf](kalaoHWloop-conf)**: the KalAO hardware specific CACAO processes

**[hardware_setupfiles](hardware_setupfiles)** contains the configuration files for the KalAO hardware\
**[turbulence_masks](turbulence_masks)** contains the masks to inject turbulence on the DM

## Sending turbulence on the DM

Start milk sessions by typing '_milk_'


- **Load turbulence file**
- milk> _loadfits "turbulence_masks/cube12_12_60000_v10mps_1ms_clean.fits" imc_
- **Open DM SHM channel** 
- milk> _readshmim dm01disp04_
- **Send turbulence on DM channel at 1000 microsecond refresh rate**
- milk> _streamburst imc dm01disp04 1000_

Help for the commands is given with:

_milk> cmd? streamburst_

## Creating _system_ cpuset

Cacao is expecting a cpuset called _system_. If it's not initialised, the following command needs to
be issued once before launching cacao.

_**sudo cset set -c 0-7 -s system**_


# Installing CACAO on KalAO RTC

## Installing end setting up openblas


_git clone https://github.com/xianyi/OpenBLAS.git_

Create ld.so.conf file to include openblas:

_echo '/opt/OpenBLAS/lib/'  | sudo tee /etc/ld.so.conf.d/openblas.conf_

Add the following line to _.bash_aliases_:

_export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/OpenBLAS/lib/pkgconfig_
 