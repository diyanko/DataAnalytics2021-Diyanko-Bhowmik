import h5py
import numpy as np
import pandas as pd
dataset = h5py.File('3B-HHR.MS.MRG.3IMERG.20160101-S013000-E015959.0090.V06B.HDF5', 'r')
dataset.keys()
grid = dataset['Grid']
grid.keys()
print("Longitude data: {}".format(grid['lon']))
print("Longitude data attributes: {}".format(list(grid['lon'].attrs))
print("Name: {}".format(grid['lon'].attrs['standard_name'].decode()))
print("Unit: {}".format(grid['lon'].attrs['units'].decode()))
print("Latitude data: {}".format(grid['lat']))
print("Latitude data attributes: {}".format(list(grid['lat'].attrs)))
print("Name: {}".format(grid['lat'].attrs['standard_name'].decode()))
print("Unit: {}".format(grid['lat'].attrs['units'].decode()))
print("Precipitation data: {}".format(grid['precipitation']))
print("Precipitation data attributes: {}".format(list(grid['precipitation'].attrs)))
print("Unit: {}".format(grid['precipitation'].attrs['units'].decode()))
longitude_values = np.repeat(list(grid['lon']), 1800)
latitude_values = list(grid['lat'])*3600
precipitation_values = np.array(list(grid['precipitation'])).flatten()
dataset = pd.DataFrame({"lon": longitude_values, "lat": latitude_values, "precipitation": precipitation_values})
dataset.columns = [grid['lon'].attrs['standard_name'].decode() + " (" + grid['lon'].attrs['units'].decode() + ")",grid['lat'].attrs['standard_name'].decode() + " (" + grid['lat'].attrs['units'].decode() + ")","Precipitation (" + grid['precipitation'].attrs['units'].decode() + ")",]
dataset.head()
dataset['Precipitation (mm/hr)'] = dataset['Precipitation (mm/hr)'].mask(dataset['Precipitation (mm/hr)'] == -9999.900391, 0)
dataset.to_csv("precipitation.csv", index = False)