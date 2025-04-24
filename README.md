# Design and Analysis of a CMOS Inverter

This repository focuses on the operation and analysis of NMOS and PMOS transistors that will lead into the design of a CMOS inverter and other circuitry. This is a learning project with the sole motivation of deepending my understanding of CMOS circuits beyond simple digital switching. Since these transistors are the buidling blocks of analog and mixed-signal ICs, this project will also serve as a gateway into more complex design topics and architectures.
I'll be using open source tools like SKY130PDK, Xschem, Ngspice, Magic, and Netgen to go from schematic to layout for the CMOS Inverter. 
   
## NMOS Transistor Summary

### NMOS as a Switch
- Turns ON when Vgs > Vth.
- Passes a strong logic 0 (GND) but a weak logic 1 (VDD - Vth).
- Substrate/Bulk is connected to the lowest potential (usually GND).

### Construction
- Built on a p-type substrate
- n+ heavily doped regions form the source and drain
- The gate is placed above a thin oxide layer; its voltage controls the channel’s conductivity -> Which we will analyze using IV characteristics.

![image](https://github.com/user-attachments/assets/205c5640-79df-47cc-ac03-18a369bfa1c2)

### Channel Dimensions
- L : Channel length — shorter lengths result in faster switching but more leakage current
- W : Channel width — wider widths provide higher drive strength

---

## IV Characteristics of an NMOS Transistor

![image](https://github.com/user-attachments/assets/837590fa-9662-41ff-9095-36c6ab011835)

The NMOS IV characteristic curve shows how the drain current Id varies with the gate-source voltage Vgs and the drain-source voltage Vds. By stepping Vgs and sweeping Vds, we can understand the behavior of the transistor under different input conditions.

### Regions of Operation

<img src="https://github.com/user-attachments/assets/9bd19def-5408-4baa-a67a-587842d9b0fc" width="500" />


| Region       | Condition                        | Behavior                        |
|--------------|----------------------------------|---------------------------------|
| **Cutoff**   | Vgs < Vth          | OFF, no current flow            |
| **Linear**   | Vgs > Vth, Vds < Vov | Transistor behaves as a resistor |
| **Saturation** | Vds >= Vgs - Vth | Transistor acts as a constant current source |

### Channel Length Modulation

The ideal current-saturation curve should flatline in the Saturation Region. In reality, however, due to Channel Length Modulation, the curve does not perfectly flatten as Vds increases beyond pinch-off.
The effects of Channel Length Modulation results in an increase in current even in the saturation region, which is reflected in the simulation below:

![image](https://github.com/user-attachments/assets/2cdff1ee-b9ff-4976-a615-52b6296cf8ad)

- The effective channel length (Leff) shortens because the electric field near the drain pulls the inversion layer (the conductive region) toward the source.
- This shortening leads to an increase in current, which is accounted for by the term (1+lambda*Vds), where lambda is the channel length modulation parameter (the term multiplies saturation region formula to reflect the linear increase in Id).


## IV Characteristics of an PMOS Transistor
![image](https://github.com/user-attachments/assets/7e9d2081-ff15-4756-b02c-9ed69bf07942)

![image](https://github.com/user-attachments/assets/3178af45-44eb-4f59-9f05-a143e7ba68cd)

