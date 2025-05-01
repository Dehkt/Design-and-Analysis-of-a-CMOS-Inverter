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

## PMOS Transistor Summary

### PMOS as a Switch
- Turns ON when Vsg > |Vth|.
- Passes a strong logic 1 (VDD) but a weak logic 0 (Vth above GND).
- Substrate/Bulk is connected to the highest potential (usually VDD).

### Construction
- Built on an n-well which is on top of the p substrate.
- p+ heavily doped regions form the source and drain
- The gate is placed above a thin oxide layer; its voltage controls the channel’s conductivity -> Which we will analyze using IV characteristics.

![image](https://github.com/user-attachments/assets/ca8a46b8-db22-4465-8b2c-dba5ae415c2b)

### Channel Dimensions
- L : Channel length — shorter lengths result in faster switching but more leakage current
- W : Channel width — wider widths provide higher drive strength

## IV Characteristics of an PMOS Transistor

![image](https://github.com/user-attachments/assets/7e9d2081-ff15-4756-b02c-9ed69bf07942)


### Regions of Operation

| Region       | Condition                         | Behavior                        |
|--------------|-----------------------------------|---------------------------------|
| **Cutoff**   | Vsg < abs(Vth)                         | OFF, no current flow            |
| **Linear**   | Vsg >  abs(Vth), Vsd < Vsg - Vth       | Transistor behaves as a resistor |
| **Saturation** | Vsd >= Vsg - Vth                 | Transistor acts as a constant current source |

We can see the the IV Curve for PMOS (Vsd vs ID) is the compliment of the NMOS curve, it also is affected by Channel Length Modulation as the current is still increasing (-ve) 
after saturation.

![image](https://github.com/user-attachments/assets/3178af45-44eb-4f59-9f05-a143e7ba68cd)

### Strong 1 Weak 0, and Strong 0 Weak 1?
Earlier I mentioned that the NMOS passes a Strong 0(GND) and a weak 1(VDD), and the PMOS passes a strong 1(VDD) and weak 0(GND).
This is a very important concept to understand so that we can ensure the reliability of our digital/analog circuit - particuluarly when it comes to
signal interperetation. We want outputs to pass both Strong 0(GND) and Strong 1(VDD) to avoid falling within the circuit's noise margin - which can cause
unpredictable behavour.

To show this effect, I will show an Inverter schematic that is flipped (PMOS in the pull down network, NMOS in the pull up network), we will then simulate both the
conventional design and my new design and check their performance.

![image](https://github.com/user-attachments/assets/9ef2c883-4db6-4893-961c-b6f57d1434ad)

(NMOS Pulling up - known to be a weak logic 1, PMOS Pulling down - known to be a weak logic 0)

![image](https://github.com/user-attachments/assets/7bf59caa-b34a-41c5-b0ae-93fcb97a4c91)

Ignoring that it does not function as an inverter, we can see that its unable to pull the output voltage to GND or VDD effectively.
This means that our noise margin has to be really small, which is not great as it allows a lot of room for any noise to significantly impact our circuit's behavour.
Why does this happen?

NMOS uses electrons as charge carriers that flow from Drain to Source, and it connects the output to GND very easily and sinks current effectively which allows for a Strong 0.
PMOS uses holes as charge carriers that flow from Source to Drain, and it connects the output to VDD easily and is great at sourcing current which allows for a Strong 1.

### Inverter Schematic (WIP)

![image](https://github.com/user-attachments/assets/e4f624f3-4555-4b4d-a77b-921c6d9e8815)

Output Waveform: Pulsing 0V to 1.8V

![image](https://github.com/user-attachments/assets/4cc466bf-f597-40f2-b32f-af2e856f73a6)

We can observe a strong 0 and strong 1 respectively, as well as proper inverter functionality. 
However, we can also observe these effects:

When before switching to low from high:

![image](https://github.com/user-attachments/assets/cd7c3d48-86ac-47a2-94b3-806bf4cde596)


And when switching from high to low:

![image](https://github.com/user-attachments/assets/9e4b9734-6708-4490-b774-fe1d1b1cdd81)

We get some ringing and other voltage spikes, this is likely due to parasitic capacitance. There is capacitance that comes due to the physical structure of the transistors, there is capacitance between the Gate-Source, Gate-Drain, Gate-Bulk/Substrate, Source-Bulk/Substrate, and Drain-Bulk/Substrate. Mainly these effects can be combatted with proper layout design, but in Schematic we can 

Note: Currently WIP, I will try to improve the circuit to combat the effects of ringing and voltage spikes.

### Inverter VTC
![image](https://github.com/user-attachments/assets/f66a9276-c653-4388-b19e-283cf96a66cc)

By sweeping our Input voltage from 0 to 1.8 (Max), we are able to see how our Vout responds to changes in Vin. 
We can use this to find the Switching Threshold Vm which is ideally VDD/2 for a symmetrical noise margin, 1.8/2 = 0.9.

![image](https://github.com/user-attachments/assets/c46c94c6-1328-4d46-b2ce-2c1dfa0900f8)


The value at which (Vin = Vout) = ~0.841863V = Vm. This is close enough but it can be improved by adjusting our PMOS width. 
In CMOS inverters PMOS W is typically 2x more than NMOS -> this helps because PMOS is slower than NMOS in switching because it uses holes as charge
carriers which are less mobile than electrons, hence why we would have to increase W to improve current flow. 

![image](https://github.com/user-attachments/assets/7a65e1c2-f02d-4a04-9214-32f9f8053b63)

After increasing PMOS width 2x:

![image](https://github.com/user-attachments/assets/1aa59431-32f0-4de2-9fc2-7a0224fcbb9c)

We can further adjust the ratio to get a result closer to 0.9V for proper noise margin symmetry (which will be covered in the next section). My final adjustment has been the PMOS W=2.7, which makes Vm = 0.89V which is very close to our desired Vm.

### Noise Analysis
Noise is everywhere, and to improve the reliability of our inputs to outputs in our inverter circuit, we have to consider this in our design. In the previous task we sized our PMOS to get a desirable Vm, and we did that so that we can define a transistion point between Logic 1 and Logic 0 (High and Low). Where anything before Vin = 0.9 will register as a Low input, and anything after will be a high input. 

After getting our desired Vm, we want to find the regions for which our gains are only 1 and -1.

#### Gain in a CMOS Inverter
The gain of an inverter is the magnitude of the slope of its VTC around the switching point Vm. 
Av = dVout/dVin 
- In flat gain regions, gain is almost 0 -> noise is completely eliminated.
- Near the switching point Vm, gain > 1 -> noise is amplified.

Gain Curve:

![image](https://github.com/user-attachments/assets/43089078-e21b-45a9-8115-5f63e94feded)

In this curve, we look at the regions where the inverter in sensitive to noise (near Vm or the switching point) where small variations in Vin cause large and unpredictable changes in Vout. The flat regions ~0 of the VTC, the output is stable and either latched to VDD or GND. Small fluctiations in Vin will not cause any practical difference in the output voltage, which is stable behavour. So, we can use this curve to define where exactly a valid input is and try to avoid putting any other inputs that will lead to indeterministic inverter behavour.

Here I have plotted (Gain >= 1)*1.8 with Vout (multiplied by 1.8 to stretch it to our Vout curve).

![image](https://github.com/user-attachments/assets/3e76306a-4bc8-411d-9aa4-1844b13cde94)

Noise Margins:
- NMh = Voh - Vih : The maximum noise that can be subtracted from a valid High input without being misinterpereted as a Low.
- NMl = Vil - Vol : The maximum noise that can be added to a valid Low input without being misinterpereted as a High.

Basically tells us how much noise our Inverter can tolerate without causing detection errors. Good noise margin means our Inverter will operate very well against fluctuations in the input due to any noise.

Vil is the maximum input we can give that will be considered a Low Input, and Vih is the minumum input that can be considered a logic High input.
Voh is the lowest voltage we will see at the output when the inverter is trying to give a High output, and Vih is the highest voltage we will see at the output when the
inverter is trying to give a Low output. 

By using the previous graph with the gain plotted on top of Vout, we can find each of these values specifically.

![image](https://github.com/user-attachments/assets/73a32346-3947-4732-becd-57c594d2cf74)

From Graph:
- Vil = 0.7625V
- Vih = 1.0124V
- Voh = 1.7470V
- Vol = 0.07V

Then NMh = 0.735V, NMl = 0.693V. Which gives us pretty large and nearly symmetric Noise Margins -> Robust to low and high input noise.

### Delay Analysis
Transient Analysis: Plotting Vin vs Vout

![image](https://github.com/user-attachments/assets/7cb36d6e-2d51-402c-842c-e0f0668f911d)


Generally for Propagation delay, we use the average of the two values tPLH and tPHL.
- tPHL - Propagation delay for a high to low transition of Vin.
- tPLH - Propagation delay for a low to high transition of Vin.

tpd = (tPLH + tPHL)/2, and we can find these two values from the given graph by measuring when both Vin and Vout are at 50% for both high to low and low to high transitions. 

- Finding tPHL -> Time difference between Vin50% and Vout50% on High to Low transition (0.9V = VDD/2) = 2.29 * 10^-11 seconds 
- Finding tPLH -> Time when Vin50% and Vout50% on Low to High transition = 2.28 * 10^-11 seconds
- tpd = (22.8ps + 22.9ps)/2 = 22.85ps.

Our Average propagation delay is really low, but this is prelayout and idealized. Real world parasticis that come from routing and capacitances will increase delay. Still, the low delay comfirms that our initial sizing was well optimized.


