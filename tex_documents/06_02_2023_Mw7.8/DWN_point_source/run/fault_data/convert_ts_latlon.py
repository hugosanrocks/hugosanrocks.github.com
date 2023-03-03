import numpy as np
import matplotlib.pyplot as plt
import utm
import os

def translate_vertex_from_utm_to_latlon(input_ts_file):
    # Reading meshing output files and translating to latlon

    # THIS IS NEED FOR THE CORRECT CONVERSION
    # zone number
    # zone letter
    zone_number = 37
    zone_letter = 'S'

    # Reading the *.ts file
    with open(input_ts_file) as f:
        file_lines = f.read().splitlines()

    # Output file to write coordinates
    out_file_name = input_ts_file[:-3]+'.xy_file'
    wf = open(out_file_name,"a")

    x_utm = []
    y_utm = []
    z_elev = []
    lat = []
    lon = []
    depth = []
    for i in file_lines:
        line = i.split(" ")
        if line[0] == 'VRTX':
            x_utm.append(np.float(line[2]))
            y_utm.append(np.float(line[3]))
            #print(x_utm,y_utm)
            z_elev.append(np.float(line[4]))
            a, b = utm.to_latlon(x_utm[-1], y_utm[-1], zone_number, zone_letter)
            lat.append(a)
            lon.append(b)
            depth.append(z_elev[-1]*-1)
            # write the lat lon
            lat_string = '{:.4f}'.format(lat[-1])
            lon_string = '{:.4f}'.format(lon[-1])
            depth_string = '{:.4f}'.format(depth[-1])
            line = lon_string + " " + lat_string + " " + depth_string
            wf.write("%s\n" % line )
    wf.close()

    return

# Translate and write fault planes in latlon
input_ts_file = 'f20.ts'
translate_vertex_from_utm_to_latlon(input_ts_file)

