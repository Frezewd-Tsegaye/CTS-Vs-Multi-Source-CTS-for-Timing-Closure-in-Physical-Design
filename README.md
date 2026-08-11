# CTS-Vs-Multi-Source-CTS-for-Timing-Closure-in-Physical-Design
Physical Design flow benchmarking traditional vs. multi-source CTS on WNS, TNS, clock skew, insertion delay, and routing congestion using ICC II and Innovus

Status: 🚧 Ongoing

## Overview

This project implements a full physical design (PD) flow — floorplanning, placement, power planning, and clock tree synthesis (CTS) and compares two CTS architectures for timing closure on the same design:


1. Traditional CTS
2. Multi-source CTS : a high-performance clocking architecture intended to reduce insertion delay and improve skew across the die


The goal is to quantify the PPA (Power, Performance, Area) trade-offs and routing congestion differences between the two architectures using real post-route STA data.

## Flow
Floorplanning → Placement → Power Planning → CTS (traditional / multi-source) → Routing → Post-route STA → DRC/LVS → QoR Comparison

## Repository Structure

```` 

CTS-Vs-Multi-Source-CTS-for-Timing-Closure-in-Physical-Design/
├── apr/                # pnr scripts and reports
├── common/             # common files for synthesis and pnr
├── constraints/        # sdc files
├── syn                 # synthesis outputs 
└── README.md

````


## Comparison Metrics

The two CTS architectures are evaluated using:

- WNS / TNS (Worst/Total Negative Slack)
- Clock skew
- Latency
- Clock insertion delay
- Routing congestion

## Progress


 - [x] Floorplanning
 - [x] Placement
 - [x] Power planning (rings, straps, rails)
 - [x] Traditional CTS implementation
 - [ ] Multi-source CTS implementation
 - [ ] Post-route STA comparison (PrimeTime)
 - [ ] DRC/LVS verification
 - [ ] Final QoR comparison report
