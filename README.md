# Hand Movement Recognition and Robotic Finger Replication

# Tianjin University - BCI WorkShop - 
# Course : Advances of Brain-computer interfaces 
# Professors : Dr.Uriel & Dr.Tareq
## Overview

This project involves creating a robotic finger with three phalanges using Autodesk Inventor, recording movement data using flexion sensors and a glove, and developing a deep neural network (DNN) in MATLAB to analyze and classify these movements. The classified movements are then replicated in real-time using an Arduino board and motor to control the robotic finger.

## Motivation

The aim of this project is to explore the capabilities of AI and robotics in replicating human hand movements. This has potential applications in prosthetics, remote control, and advanced robotics.

## Getting Started

### Prerequisites

- MATLAB
- Arduino IDE
- Autodesk Inventor
- Flexion sensors
- Glove
- Motor

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Alex-Irae/Hand_Movement_Recognition.git
   ```
Follow the instructions in the setup directory for setting up the hardware and software.


### Data Collection
#### Data is collected using a glove equipped with flexion sensors. The movements recorded include:

- Index finger flexion
- Left to right movement
- Back and forth movement
- Overall hand movements
- Model Training and Testing



#### The recorded data is used to train a deep neural network (DNN) in MATLAB. The steps involved are : 
- Preprocessing the data
- Training the DNN
- Testing the model to ensure accuracy
- Real-Time Input and Replication
- An Arduino board is used to replicate the classified movements in real-time. The process involves:


### Process
- The glove records a movement.
- The AI analyzes and classifies the movement.
- The motor, controlled by the Arduino, replicates the movement with the robotic finger.
