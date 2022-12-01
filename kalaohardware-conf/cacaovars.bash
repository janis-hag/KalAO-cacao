# cacao environment variables for setup
# This file will be sourced by cacao-setup

# 1 if DM actuators are on a coordinate grid
# This informs processes if a spatial relationship exists
# between DM actuators
export CACAO_DMSPATIAL="1"

# Deformable mirror (DM) size
# If DM is single dimension, enter "1" for DMsize
#
export CACAO_DMxsize="12"
export CACAO_DMysize="12"


export CACAO_DMINDEX="01"
export CACAO_LOOPNUMBER="1"

# input WFS stream
export CACAO_WFSSTREAM="shwfs_slopes"

export CACAO_LOOPDATALOGDIR="$(pwd)/datalogdir"

# ========================================
#       FPS processes to be set up
# ========================================

# BMC DM hardware control
#
export CACAO_FPSPROC_BMCDISP="ON"


# NUVU acquisition: read raw nuvu stream and reformats into clean stream
#
export CACAO_FPSPROC_NUVUACQ="ON"

# SHWFS processing: reads nuvu stream and process Shack-Hartman slopes
#
export CACAO_FPSPROC_SHWFSPROC="ON"

