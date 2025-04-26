v {xschem version=3.4.7RC file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -80 -30 -80 -10 {lab=#net1}
N -80 -30 -30 -30 {lab=#net1}
N -80 50 -80 70 {lab=GND}
N 10 -110 110 -110 {lab=Vsd}
N 10 -110 10 -60 {lab=Vsd}
N 110 -110 110 -90 {lab=Vsd}
N 110 -30 110 -0 {lab=GND}
N 10 0 10 20 {lab=GND}
N 10 -30 70 -30 {lab=#net2}
N 70 30 70 50 {lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} -10 -30 0 0 {name=M1
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
model=pfet_01v8
spiceprefix=X
}
C {devices/code_shown.sym} -300 -260 0 0 {name=s1 only_toplevel=false value=".lib /home/victor/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc Vsd 0 -1.8 -.1m Vsg 0 -1.8 -.1
.save all
.end"}
C {devices/vsource.sym} -80 20 0 0 {name=Vsg value=0 savecurrent=false}
C {devices/gnd.sym} 110 0 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 110 -60 0 0 {name=Vsd value=0 savecurrent=false}
C {devices/gnd.sym} -80 70 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 10 20 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 70 0 0 0 {name=Vb value=1.8 savecurrent=false}
C {devices/gnd.sym} 70 50 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 10 -110 0 0 {name=p1 sig_type=std_logic lab=Vsd}
