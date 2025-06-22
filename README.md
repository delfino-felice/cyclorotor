# cyclocopter

This project aims to build a tricopter powered by two cyclorotors and one traditional propeller. Yaw control is managed through a servo mechanism that adjusts the orientation of the third motor. The primary goal is to explore alternative propulsion technologies for small UAVs by integrating cycloidal rotor mechanics into a simplified multicopter design.

The vehicle is almost entirely 3D-printed, excluding standard components such as motors, screws, and wiring. Lightweight PLA (LW-PLA) was selected as the primary material to minimize overall mass—critical for aerial vehicles—while standard PLA was used selectively in structural areas where greater strength and rigidity are required.

## Structure

The drone's structure is based on a carbon fiber tube with a 12 mm diameter and approximately 50 cm in length, chosen for its lightweight and rigid properties. At each end of the tube, a cyclorotor assembly is mounted using dual bearings for smooth and reliable rotation. These cyclorotors provide the primary lift and assist in directional thrust.

A 3D-printed clamp is positioned at the center of the tube, acting as the core structural node. It integrates and supports:

- The flight battery: 2700mAh 3s1p LiPo
- Power distribution board (PDB)
- Flight controller: F7
- Cyclorotor motors with a belt tensioning system (see photos)
- A pivoting mount and rotating joint for the rear motor, which consists of a traditional propeller attached to a servo-actuated joint. This setup provides additional thrust and enables yaw control (see photos).

## Electronics

The electronic subsystem provides stable power distribution, motor control, flight assistance (stabilization, altitude hold), and control signal routing. It includes:

- A LiPo battery connected to a Power Distribution Board (PDB)
- Brushless motors: two A2212 for the cyclorotors and one A2208 for the traditional propeller
- 30A ESCs to drive all motors
- An F7-based flight controller for real-time stabilization and control
- An Arduino-based radio receiver is used for manual remote operation. While it does not match the signal range of dedicated radio systems, it remains a cost-effective option for simple startup procedures and hovering tests.
- A servo for yaw control linked to the third motor mount

## Things to Do

Tasks that must be completed before MFR2025 and have already been thoroughly analyzed:

- Integration of the flight controller and radio receiver
- fly

## Future Ideas

Concepts for potential future upgrades, pending further analysis and decision:

- Autonomous flight capabilities: path following (e.g., with ArduPilot) and collision avoidance — key features for exploring future urban air mobility
- Larger or additional wings to increase lift capabilities and enable transportation of heavier payloads, potentially leading to a dedicated cargo version
- Thrust vectoring control (TVC) for the cyclorotors to unlock the full potential of this propulsion method
- Advanced linkage systems, such as the track-guided variable pitch mechanism seen in other experimental prototypes, which could simplify the addition of more blades and allow for higher rotational speeds, thus increasing thrust
- Build guide
