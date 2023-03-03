import numpy as np
import matplotlib.pyplot as plt
import utm
import os

def convert_file_from_latlon_to_utm(in_file_name):
    #in_file_name: input file name

    #out_file_name: output file name

    out_file_name = in_file_name[:-3] + '.utm'
    os.system('rm ' + out_file_name)

    #mesh reference origin
    #xref = 3.5926073639e+05;
    #yref = 4.7348538692e+06;
    #zref = 0.0000000000e+00;

    #reading input file
    lon_fault, lat_fault = np.loadtxt(in_file_name, delimiter=' ', usecols=(0, 1), unpack=True)

    # conversion of coordinates from lat lon to y x
    y_utm = []
    x_utm = []
    elev = []
    zone_number = []
    zone_letter = []
    # enters (lat, lon) outs (east, north, zonenumber, zoneletter)
    for i in range(len(lon_fault)):
        x, y, a, b = utm.conversion.from_latlon(lat_fault[i],lon_fault[i])
        y_utm.append(y)
        x_utm.append(x)
        elev.append(0.)
        zone_number.append(a)
        zone_letter.append(b)
    print(zone_number, zone_letter)

    # The two reference points are the initial points
    # which are the two south extremes of both faults
    # first points of Fault1.utm and Fault2.utm
    #   run for fault1.xy     |  for fault2.xy
    #print(x_utm[0],y_utm[0],a,b)
    #x_utm.append(3.5926073639e+05)
    #y_utm.append(4.7348538692e+06)
    x_utm = x_utm #- x_utm[0] #+ 14096.585490327328 
    y_utm = y_utm #- y_utm[0] #- 30598.142886190675
    print(x_utm[1],y_utm[1],a,b)

    #write the output file
    wf = open(out_file_name,"a")
    for i in range(len(x_utm)):
        x_string='{:.10e}'.format(x_utm[i])
        y_string='{:.10e}'.format(y_utm[i])
        elev_string = '{:.10e}'.format(elev[i])
        line = x_string + " " + y_string + " " + elev_string
        wf.write("%s\n" % line )
    wf.close()

    return


# Run conversion from latlon to utm
in_file_name = input()
convert_file_from_latlon_to_utm(in_file_name)


