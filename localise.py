import numpy as np
from numpy import sqrt
import matplotlib.pyplot as plt
import scipy as sp
from scipy import stats
import math


#
#
# Detect the distance from each receiver to the transmitter
#
#
a="/Users/jordiarnau/Documents/Petnica /EBat/outputs/test.txt"
y = np.fromfile (a, int, -1 ,"    ")

y1 = y[0::5];
y2 = y[1::5];
y3 = y[2::5];

for i in range(0,4):
    if i == 0:
        interval = 10
        snr=np.zeros(len(y1)/interval)
        for k in range(0,len(y1)/interval-1,1):
            snr[k] = sp.stats.signaltonoise(y1[k*interval-interval:k*interval])
        
        results=np.zeros(len(y1)/interval)
        rcount = 0
        for k in range(0,len(y1)/interval-1,1):
            if snr[k] < 100:
                results[rcount]= k*interval-interval
                rcount += 1
        
        for k in range(0,rcount,1):
            if results[k+1]*results[k]!=0:
                if results[k+1]-results[k]<11:
                    yx1= results[k]
                    break
        plt.figure(1)
        plt.plot(y1)
        #print 1.06751967382*yx1
        
    elif i == 1:
        interval = 10
        snr=np.zeros(len(y2)/interval)
        for k in range(0,len(y2)/interval-1,1):
            snr[k] = sp.stats.signaltonoise(y2[k*interval-interval:k*interval])
        
        results=np.zeros(len(y2)/interval)
        rcount = 0
        for k in range(0,len(y2)/interval-1,1):
            if snr[k] < 100:
                results[rcount]= k*interval-interval
                rcount += 1
        
        for k in range(0,rcount,1):
            if results[k+1]*results[k]!=0:
                if results[k+1]-results[k]<11:
                    yx2= results[k]
                    break
        plt.figure(2)
        plt.plot(y2)
        #print 1.06751967382*yx2

    elif i == 2:
        interval = 10
        snr=np.zeros(len(y3)/interval)
        for k in range(0,len(y3)/interval-1,1):
            snr[k] = sp.stats.signaltonoise(y3[k*interval-interval:k*interval])
        
        results=np.zeros(len(y3)/interval)
        rcount = 0
        for k in range(0,len(y3)/interval-1,1):
            if snr[k] < 100:
                results[rcount]= k*interval-interval
                rcount += 1
        
        for k in range(0,rcount,1):
            if results[k+1]*results[k]!=0:
                if results[k+1]-results[k]<11:
                    yx3= results[k]
                    break
        plt.figure(3)
        plt.plot(y3)
        #print 1.06751967382*yx3

d1= 1.06751967382*yx1
d2= 1.06751967382*yx2
d3= 1.06751967382*yx3  
      
print d1
print d2
print d3


#
#
#  Calculate the coordinates of the transmitter
#
#

#print transmission
Receiver1 = [0,70]
Receiver2 = [50,0]
Receiver3 = [110,50]


d= Receiver2[0]
i= Receiver3[0]
j= Receiver3[1]
 
#Create the "vector's magnitude" function
def mag(x):
    recieve = math.sqrt(pow(x[0], 2)+pow(x[1], 2))
    return recieve
def subvec(x, y):
    recieve2 = [x[0]-y[0], x[1]-y[1]]
    return recieve2


r1=d1 
r2=d2
r3=d3


#Change of base
ex = [subvec(Receiver2, Receiver1)[0]/mag(subvec(Receiver2 , Receiver1)),subvec(Receiver2, Receiver1)[1]/mag(subvec(Receiver2 , Receiver1))]
i = ex[0]*subvec(Receiver3, Receiver1)[0]+ex[1]*subvec(Receiver3 , Receiver1)[1]
ey = [subvec(subvec(Receiver3 , Receiver1),[i*ex[0],i*ex[1]])[0]/(mag(subvec(subvec(Receiver3 , Receiver1),[i*ex[0],i*ex[1]]))),subvec(subvec(Receiver3 , Receiver1),[i*ex[0],i*ex[1]])[1]/(mag(subvec(subvec(Receiver3 , Receiver1),[i*ex[0],i*ex[1]])))]
d = mag(subvec(Receiver2 , Receiver1))
j = ey[0]*subvec(Receiver3, Receiver1)[0]+ey[1]*subvec(Receiver3 , Receiver1)[1]

 
#Calculate the x, y coordinates according to the new base
x = (pow(r1, 2)-pow(r2, 2)+pow(d, 2))/(2*d)
y = (pow(r1, 2)-pow(r3, 2)+pow(i, 2)+pow(j, 2))/(2*j)-i/j*x

#If we don't use these variables, in the next step, y will use the x = Receiver1... value, not the x = (pow... value
X=x
Y=y

#Calculate the x, y coordinates according to the original base
x = Receiver1[0] + X*ex[0] + Y*ey[0]
y = Receiver1[1] + X*ex[1] + Y*ey[1]

print x
print y

plt.figure(4)
plt.scatter(x,y, color='red')
plt.scatter(Receiver1[0],Receiver1[1])
plt.scatter(Receiver2[0],Receiver2[1])
plt.scatter(Receiver3[0],Receiver3[1])

plt.show()
