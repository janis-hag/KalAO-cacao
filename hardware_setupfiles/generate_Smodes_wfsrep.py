
import numpy as np

from astropy.io import fits


data, header = fits.getdata('Smodes.WFSresp.fits', header=True)

gradient = np.arange(12)/11
flat = np.ones((12,12))

#data[1] = np.where(np.abs(data[1])>0, (gradient*flat+(gradient*flat).T)-1, 0)
#data[0] = (np.where(np.abs(data[1])>0, (gradient*flat+(gradient*flat).T)-1, 0))*-1

data[0] = np.where(np.abs(data[1])>0, (-2*gradient*flat).T+1, 0)
data[1] = np.where(np.abs(data[1])>0, (2*gradient*flat)-1, 0)

fits.writeto('smodes.fits', data, header=header)
