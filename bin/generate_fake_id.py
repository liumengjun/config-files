#!/usr/bin/python
import datetime
import random

def calc_checkcode(id_num_pre):
    w = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]
    c = [1,0,'X',9,8,7,6,5,4,3,2]
    s = 0
    for i in range(17):
        s += int(id_num_pre[i])*w[i]

    r = c[s%11]
    return r

def generate_ic_num(count=10):
    area = random.randint(100000,999999)
    year = random.randint(1984,2004)
    month = random.randint(1,12)
    day = random.randint(1,31)
    date = '%s%02d%02d'%(year,month,day)
    s = random.randint(1,990)
    for i in range(s, count+s):
        pre = '%s%s%03d'%(area,date,i)
        ck = calc_checkcode(pre)
        id_num = pre+str(ck)
        print (id_num)

if __name__ == '__main__':
    generate_ic_num();
