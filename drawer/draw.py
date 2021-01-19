import numpy as np
import sys
import csv
import matplotlib.pyplot as plt

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

def printPic(x,y,name):
    plt.title('pic')
    colors=['red','yellow','green','blue','cyan','violet']
    for i in range(0,len(y)):
        print(name[i+1])
        plt.scatter(x , y[i],s=30 , marker='o',c=colors[i],label=name[i+1],alpha=0.6)


    plt.show()

if __name__ == '__main__':
    dict_1 = {}

    Name = []
    with open("../scripts/temp.csv", "r") as csvfile:
        reader = csv.reader(csvfile)
        for line in reader:
            if dict_1.get(line[1]) is None:
                dict_1[line[1]] = float(line[7])
                Name = np.append(Name,line[1])
            else:
                dict_1[line[1]] = np.append(dict_1.get(line[1]),float(line[7]))


    Other = []
    for i in range(1,len(Name)):
        Other = np.append(Other,dict_1[Name[i]],axis=0)
    Other = np.reshape(Other,(len(Name) - 1,len(Other)//(len(Name)-1)))

    printPic(dict_1[Name[0]],Other,Name)