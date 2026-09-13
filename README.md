# 🤖 Complete Simulation of a 2-Link Robot
## Using Kinematics, Jacobian Analysis and Lagrangian Dynamics

A complete MATLAB simulation project for analysing and visualising a **2-Link Planar Robot Manipulator**.

The project includes:

- Forward Kinematics
- Inverse Kinematics
- Robot Visualization
- Trajectory Generation
- Jacobian Analysis
- End-Effector Velocity
- Kinetic & Potential Energy
- Lagrangian Dynamics
- Dynamic Equation
- Required Joint Torque
- Complete Simulation

---

# 🎯 Project Goal

The goal of this project is to simulate the complete behaviour of a **2-Link Robotic Manipulator**.

```text
Joint Angles / Target Position
            ↓
      Kinematics
            ↓
   Robot Position & Motion
            ↓
      Jacobian Analysis
            ↓
   End-Effector Velocity
            ↓
   Lagrangian Dynamics
            ↓
     Required Torque
🖼️ 1. Robot Structure
                    End Effector
                         🔵
                        /
                       /
                  Link 2
                     /
                    /
              🔴 Joint 2
                 /
                /
           Link 1
              /
             /
        🔴 Base

The robot contains:

🔴 Base Joint
🔴 Second Revolute Joint
Link 1
Link 2
🔵 End Effector
Robot Input
Input	Meaning
θ₁	Joint 1 Angle
θ₂	Joint 2 Angle
θ̇₁	Joint 1 Velocity
θ̇₂	Joint 2 Velocity
θ̈₁	Joint 1 Acceleration
θ̈₂	Joint 2 Acceleration
l₁	Length of Link 1
l₂	Length of Link 2
m₁	Mass of Link 1
m₂	Mass of Link 2
Robot Output
Output	Meaning
X, Y	End-Effector Position
Ẋ, Ẏ	End-Effector Velocity
T	Kinetic Energy
V	Potential Energy
L	Lagrangian
τ₁	Joint 1 Required Torque
τ₂	Joint 2 Required Torque
🔄 2. Complete Project Flowchart
                 ┌───────────────┐
                 │     START     │
                 └───────┬───────┘
                         │
                         ▼
              ┌─────────────────────┐
              │ Robot Parameters   │
              │ l1, l2, m1, m2     │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Forward Kinematics │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Robot Visualization│
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Inverse Kinematics │
              │ Target → Angles    │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Trajectory         │
              │ Motion Path        │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Jacobian Matrix    │
              │ Joint → EE Velocity│
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Lagrangian Analysis│
              │ Energy Calculation │
              └─────────┬───────────┘
                        │
                        ▼
              ┌─────────────────────┐
              │ Dynamic Equation   │
              │ M + C + G → Torque │
              └─────────┬───────────┘
                        │
                        ▼
                 ┌───────────────┐
                 │    RESULTS    │
                 └───────────────┘
📁 3. Project File Structure
2-Link-Robot-Simulation/
│
├── main_simulation.m
│
├── two_link_robot.m
│
├── two_link_inverse_kinematics.m
│
├── two_link_trajectory.m
│
├── two_link_jacobian.m
│
├── two_link_lagrangian.m
│
├── two_link_dynamics.m
│
└── README.md
📁 4. MATLAB Files Flow
                     main_simulation.m
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
two_link_robot     Inverse Kinematics      Trajectory
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                            ▼
                    Jacobian Analysis
                            │
                            ▼
                   End-Effector Velocity
                            │
                            ▼
                   Lagrangian Analysis
                            │
                            ▼
                    Robot Dynamics
                            │
                            ▼
                     Joint Torque
                            │
                            ▼
                     FINAL OUTPUT
🤖 5. Module 1 — Forward Kinematics

Forward Kinematics calculates the robot position using the given joint angles.

Input
θ₁
θ₂
l₁
l₂
Process
Joint Angles
     │
     ▼
Calculate Joint 1 Position
     │
     ▼
Calculate Joint 2 Position
     │
     ▼
Calculate End-Effector Position
     │
     ▼
Draw Robot
Main Equations
x₁ = l₁ cos(θ₁)

y₁ = l₁ sin(θ₁)


x₂ = x₁ + l₂ cos(θ₁ + θ₂)

y₂ = y₁ + l₂ sin(θ₁ + θ₂)
Output
        🔵 End Effector (X,Y)
       /
      /
     🔴 Joint 2
    /
   /
  🔴 Base
🎯 6. Module 2 — Inverse Kinematics

Inverse Kinematics calculates the required joint angles for a desired target position.

Input
Target Position

X
Y
Flow
      Target Position
            │
            ▼
   ┌─────────────────┐
   │ Check Reachable │
   └────────┬────────┘
            │
            ▼
      ┌───────────┐
      │ Reachable │
      └─────┬─────┘
            │
       ┌────┴────┐
       │         │
      YES        NO
       │         │
       ▼         ▼
Calculate      Error
 θ₂           Message
       │
       ▼
Calculate θ₁
       │
       ▼
Robot Position
Working
Target (X,Y)
      │
      ▼
Calculate θ₁ and θ₂
      │
      ▼
Forward Kinematics Verification
      │
      ▼
Robot Reaches Target
📈 7. Module 3 — Trajectory Generation

Trajectory generation shows how the robot moves over time.

Time
 │
 ▼
New Joint Angles
 │
 ▼
Forward Kinematics
 │
 ▼
New X,Y Position
 │
 ▼
Store Position
 │
 ▼
Draw Path
Final Result
        • • • •
     •           •
   •               •
     •           •
        • • • •

This represents the End-Effector Motion Path.

⚡ 8. Module 4 — Jacobian & Velocity

The Jacobian connects joint velocities with End-Effector velocity.

Joint Velocities

 θ̇₁       θ̇₂
  │         │
  └────┬────┘
       │
       ▼
  Jacobian Matrix
       │
       ▼
End-Effector Velocity

 Ẋ       Ẏ
Jacobian Relationship
[Ẋ]       [θ̇₁]
[Ẏ] = J × [θ̇₂]
Visualization
              ↑ Velocity
              │
              🔵──────►
             /
            /
           🔴
          /
         /
        🔴

The arrow represents the direction and magnitude of End-Effector motion.

⚙️ 9. Module 5 — Lagrangian Analysis

The Lagrangian model is created using the robot energy.

Robot Motion
     │
     ├───────────────┐
     ▼               ▼
Kinetic Energy    Potential Energy
     │               │
     └───────┬───────┘
             │
             ▼
          L = T - V
             │
             ▼
     Robot Dynamic Model
Energy Components
T = Kinetic Energy

V = Potential Energy

L = T - V
🏋️ 10. Module 6 — Robot Dynamics

The robot dynamics calculates the torque required to move the robot.

Joint Position q
      │
      ▼
Mass Matrix M(q)
      │

Joint Velocity q̇
      │
      ▼
Coriolis Matrix C(q,q̇)
      │

Gravity
      │
      ▼
Gravity Vector G(q)
      │
      ▼

┌─────────────────────────────┐
│     TOTAL JOINT TORQUE      │
│                             │
│ τ = Mq̈ + Cq̇ + G           │
│                             │
└──────────────┬──────────────┘
               │
               ▼
       Motor Torque Required
🔧 11. Dynamic Equation

The complete dynamic equation of the robot is:

τ = M(q)q̈ + C(q,q̇)q̇ + G(q)

Where:

τ       → Required Joint Torque

M(q)    → Mass / Inertia Matrix

C(q,q̇) → Coriolis and Centrifugal Effects

G(q)    → Gravity Effects

q̈      → Joint Acceleration

q̇      → Joint Velocity

q       → Joint Position
🔥 12. Complete Working Flow

This is the complete workflow of the project.

                         START
                           │
                           ▼
                 SET ROBOT PARAMETERS
                           │
                           ▼
                 ┌─────────────────┐
                 │  JOINT ANGLES   │
                 │    θ₁, θ₂       │
                 └────────┬────────┘
                          │
                          ▼
                 FORWARD KINEMATICS
                          │
                          ▼
                  END EFFECTOR (X,Y)
                          │
              ┌───────────┼────────────┐
              │           │            │
              ▼           ▼            ▼
           ROBOT       TRAJECTORY   JACOBIAN
           DISPLAY         PATH      ANALYSIS
                                          │
                                          ▼
                                  END-EFFECTOR
                                    VELOCITY
                                          │
                                          ▼
                                    JOINT MOTION
                                          │
                                          ▼
                                  KINETIC ENERGY
                                          │
                                          ▼
                                 POTENTIAL ENERGY
                                          │
                                          ▼
                                    LAGRANGIAN
                                          │
                                          ▼
                                  DYNAMIC MODEL
                                          │
                                          ▼
                                REQUIRED TORQUE
                                          │
                                          ▼
                                   FINAL RESULTS
🎬 13. Simulation Workflow

The simulation works in the following order:

INPUT
  │
  ▼
Robot Parameters
  │
  ▼
Joint Angles
  │
  ▼
Forward Kinematics
  │
  ▼
Robot Position
  │
  ├───────────────┐
  │               │
  ▼               ▼
Animation      Trajectory
  │               │
  └───────┬───────┘
          │
          ▼
       Jacobian
          │
          ▼
End-Effector Velocity
          │
          ▼
     Energy Analysis
          │
          ▼
   Lagrangian Dynamics
          │
          ▼
    Required Torque
          │
          ▼
        RESULTS
📊 14. Final Output Dashboard

The final MATLAB simulation provides:

┌──────────────────────────────────────────┐
│       2-LINK ROBOT SIMULATION            │
├────────────────────┬─────────────────────┤
│                    │                     │
│   🤖 Robot         │  📈 End-Effector    │
│   Animation        │     Trajectory      │
│                    │                     │
├────────────────────┼─────────────────────┤
│                    │                     │
│   ⚡ Velocity       │  🏋️ Joint Torque    │
│   Analysis         │     Analysis        │
│                    │                     │
├────────────────────┼─────────────────────┤
│                    │                     │
│   📐 Kinematics    │  ⚙️ Dynamics         │
│   Results          │     Results         │
│                    │                     │
└────────────────────┴─────────────────────┘
📊 15. Expected Results

After running main_simulation.m, the project provides:

✓ Robot Position

✓ End-Effector Position

✓ Forward Kinematics Result

✓ Inverse Kinematics Result

✓ Robot Animation

✓ End-Effector Trajectory

✓ Jacobian Matrix

✓ End-Effector Velocity

✓ Kinetic Energy

✓ Potential Energy

✓ Lagrangian

✓ Dynamic Equation

✓ Required Joint Torque
🚀 How to Run
STEP 1
Open MATLAB Online
        │
        ▼
STEP 2
Upload / Open all project files
        │
        ▼
STEP 3
Keep all .m files in the same folder
        │
        ▼
STEP 4
Open main_simulation.m
        │
        ▼
STEP 5
Click RUN
        │
        ▼
COMPLETE ROBOT SIMULATION
💻 Main Simulation Command

Run:

main_simulation

The main file executes the complete robot simulation workflow.

🧠 Technologies Used
MATLAB Online
        │
        ├── Mathematical Computation
        │
        ├── Robot Kinematics
        │
        ├── Matrix Calculations
        │
        ├── Jacobian Analysis
        │
        ├── Lagrangian Dynamics
        │
        └── Robot Visualization
🏆 Project Achievement
              INPUT
                │
                ▼
        COMPLETE ROBOT MODEL
                │
                ▼
           KINEMATICS
                │
                ▼
        POSITION & MOTION
                │
                ▼
           VELOCITY
                │
                ▼
            ENERGY
                │
                ▼
           DYNAMICS
                │
                ▼
            TORQUE
                │
                ▼
      COMPLETE MATLAB SIMULATION
🤖 Final Project Summary
Joint Angles / Target Position
              │
              ▼
        FORWARD / INVERSE
          KINEMATICS
              │
              ▼
        ROBOT POSITION
              │
              ▼
      TRAJECTORY & MOTION
              │
              ▼
       JACOBIAN ANALYSIS
              │
              ▼
    END-EFFECTOR VELOCITY
              │
              ▼
     KINETIC + POTENTIAL
           ENERGY
              │
              ▼
       LAGRANGIAN MODEL
              │
              ▼
       ROBOT DYNAMICS
              │
              ▼
       REQUIRED TORQUE
              │
              ▼
       🤖 FINAL SIMULATION
