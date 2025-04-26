v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -50 -10 -50 10 {lab=Vgs}
N -50 -10 10 -10 {lab=Vgs}
N -50 70 -50 90 {lab=GND}
N 50 -80 50 -40 {lab=Vds}
N 50 -80 180 -80 {lab=Vds}
N 180 -80 180 -40 {lab=Vds}
N 180 20 180 40 {lab=GND}
N 50 -10 60 -10 {lab=GND}
N 50 20 50 50 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 30 -10 0 0 {name=M1
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
C {devices/vsource.sym} 180 -10 0 0 {name=Vds value=0 savecurrent=false}
C {devices/gnd.sym} 50 50 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -50 40 0 0 {name=Vgs value=0 savecurrent=false}
C {devices/gnd.sym} -50 90 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 180 40 0 0 {name=l3 lab=GND}
C {devices/code_shown.sym} -360 -250 0 0 {name=s1 only_toplevel=false value=".lib /home/victor/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vds 0 1.8 .1m Vgs 0 1.8 .1
.save all
.end"}
C {devices/gnd.sym} 60 -10 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 50 -80 0 0 {name=p1 sig_type=std_logic lab=Vds}
C {devices/lab_pin.sym} -50 -10 0 0 {name=p2 sig_type=std_logic lab=Vgs}
