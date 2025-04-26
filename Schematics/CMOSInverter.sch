v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 10 -90 10 -50 {lab=Vout}
N -60 -20 -30 -20 {lab=Vin}
N -60 -120 -60 -20 {lab=Vin}
N -60 -120 -30 -120 {lab=Vin}
N 10 -70 30 -70 {lab=Vout}
N 10 10 10 30 {lab=GND}
N 10 -20 30 -20 {lab=GND}
N 10 -170 10 -150 {lab=VDD}
N 10 -180 10 -170 {lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} -10 -20 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} -10 -120 0 0 {name=M2
L=0.15
W=2
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 30 -20 0 0 {name=l1 lab=GND}
C {devices/ipin.sym} -60 -70 0 0 {name=p6 lab=Vin}
C {devices/opin.sym} 30 -70 0 0 {name=p7 lab=Vout}
C {devices/ipin.sym} 10 30 3 0 {name=p1 lab=GND}
C {devices/ipin.sym} 10 -180 1 0 {name=p3 lab=VDD}
