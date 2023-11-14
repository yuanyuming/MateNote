
## Summary
With the emergence of Information and Communicatio Technologies (ICT) and wireless embedded sensing devices into Modern vehicles, Intelligent Transport System (ITS) becomes a Reality and an indispensable component of smart cities. The Purpose of ITS is to improve road safety and traffic efficiency as Well as offering infotainments services. In fact, warning drivers In the right time about dangerous situations on the road and Providing them with prior information about traffic will Undoubtedly leads to enhance driver’s safety and reduce traffic Congestion. Technically speaking, ITS is based on self organizing Wireless networks, known as vehicular ad-hoc Networks (VANETs). Mobile vehicles in VANET might play the Role of stationary sensors in infrastructure-based networks. They Can detect, gather and disseminate real-time data about traffic, Driving conditions and potential hazards on roads. In this respect, We review in this study, recent developments on the design of VANET protocols and applications. We first introduce the Architecture of VANETs then we review their unique Characteristics and applications. Thereafter, we discuss the main Research challenges and open issues to be considered for Designing efficient and a cost-effective VANET protocols and Applications.
Key words: VANET, Protocols, Data dissemination, Data aggregation, RSU Deployment.

## 1 . Introduction

Recently, with the emergence of Information and Communication Technologies (ICT) and wireless Embedded sensing devices into modern vehicles, Intelligent Transport System (ITS) becomes a reality and An indispensable component of smart cities. The purpose Of ITS is to improve road safety and traffic efficiency as Well as offering infotainments services. In fact, warning Drivers in the right time about dangerous situations on the Road and providing them with prior information about Traffic will undoubtedly leads to enhance driver’s safety And reduce traffic congestion. Technically speaking, ITS is Based on self-organizing wireless networks [1], [2], [3], [4], known as vehicular ad-hoc networks (VANETs) [5]. In these mobile networks, vehicles are self-organized and Communicate each with other without requiring any Infrastructure or centralized coordinating entity [6]. Mobile vehicles in VANET might play the role of Stationary sensors in infrastructure-based networks. They Can detect, gather and disseminate real-time data about Traffic, driving conditions and potential hazards on roads. In fact, disseminating such data in VANET would enhance Road safety and driving comfort [7], [8]. Due to the Characteristics of VANETs, such as the high mobility of Vehicles, network partitions and fragmentation, Information must be exchanged in an efficient way to Avoid the well-known broadcast storm problem [9], [10], [11]. In this respect, designing efficient protocols and Application for VANET has become a core and Challenging issue, which has attracted the interest of Researchers, networking professionals and automotive Companies [12], [13], [14], [15]. In this study, we review Recent developments on the design of VANET protocols And applications. We first introduce the architecture of VANETs then we review their unique characteristics and Applications. Thereafter, we discuss the main research Challenges and open issues to be considered for designing Efficient and a cost-effective VANET protocols and Applications. The remainder of this paper is structured as follows. In Section 2, we introduce the architecture of VANET, Including its main components and interactions between Them. The unique VANET characteristics are discussed in Section 3 followed by detailed description of VANET Applications in Section 4. In Section 5, we discuss the Main research challenges and open issues to be considered For designing efficient and a cost-effective VANET Protocols and applications. Finally, Section 6 concludes This paper and pins down some research directions and Perspectives.

## 2 . VANET Architecture
In what follows, we thoroughly describe the main VANET Components and the interactions between them.
### 2 .1 Main components
With respect to the IEEE 1471-2000 [16] and ISO/IEC 42010 [17] standards, VANET components are classified Into three domains:

- Mobile domain includes the vehicle and the mobile device domains. The former comprises all type of vehicles (e.g., cars, trains, buses). The latter includes all types of portable devices (e.g., smartphones, laptop, smart watches).
	- **Infrastructure domain** incorporates the roadside infrastructure domain (e.g., traffic light, camera, etc.) and the centra l infrastructure domain (e.g., Traffic Management Centres (TMCs), Vehicle Management Centres).
	- **Generic domain** includes the Internet and the Private infrastructures.

The European architecture standard for VANETs is little different. In fact, it relies on the CAR-2-X communication system pursued by the CAR-2-CAR Communication Consortium [18]. As shown in Figure 1, the reference architecture of the C 2 C Communication System, comprises the following domains:

- In-vehicle domain is composed of one or multiple application units (AUs) and one On Board Unit (OBU). An AU is a dedicated device, which can be an integrated part of a vehicle or a separate portable device such as smartphone, laptop, etc. It runs one or many applications that exploit the OBU communication capabilities. The AUs and OBU are permanently connected through a wired or wireless connection. 
- Ad-hoc domain is composed of vehicles equipped with OBUs and stationary Road-Side Units (RSUs) deployed in specific locations along the road. OBUs can communicate each with other, directly or via multi-hop, using wireless short-range communication devices allowing ad-hoc communications between vehicles. An RSU is a stationary device that can be connected to an infrastructure network or to the Internet. It can send, receive or forward data in the ad-hoc domain (i.e., vehicles equipped with OBUs and RSUs), which enables to extend the coverage of the ad-hoc network. An OBU may access to the Internet via an infrastructure connected RSU, public commercial or private wireless Hot Spots (HSs) to communicate with Internet nodes or servers. 
- Infrastructure domain access consists of HSs and RSUs. In case that neither RSUs nor HSs provide Internet access, OBUs can exploit cellular radio networks for example HSDPA, WiMax and 4 G.


### 2 .2. Communication Architecture 

VANET communications are categorized as follows [7]:
- **In-vehicle communication** between OBU of the vehicle and its AUs. 
- **Vehicle-to-vehicle (V2V)** wireless communications between vehicles via their OBUs. 
- **Vehicle-to-infrastructure (V2I)** refers to bidirectional wireless communications between vehicles and infrastructure-connected RSUs. 
- **Infrastructure-to-Infrastructure (I2I)** communications between RSUs enable extending the coverage of the network. 
- **Vehicle-to-broadband cloud (V 2 B)** communications between vehicles and broadband cloud via wireless broadband technologies such as 3G/4G.

![[Pasted image 20230818162742.png]]
Fig. 1 C2C-CC reference architecture

## 3 . Characteristics of VANETs 
VANETs are special type of ad-hoc networks distinguished by the following characteristics derived from [19] and [20]:
![[Pasted image 20230818162934.png]]
Fig. 2 Vehicle mobility
- Mobility: VANETs are mainly composed of fixed RSUs and moving vehicles. Vehicle’s speed varies from very low to very high, leading to new communication challenges. Indeed, in areas of high traffic jam, vehicles are stopped or moving slowly and therefore they have enough time to exchange messages. However, they face major challenges due to the high density of vehicles such as data collision, channel fading, message dropping and other interference problems. In areas of low traffic (e.g., highway), vehicle speed is very high leading to others communication challenges such as small communication window (few seconds), link failures, high end-to-end (ETE) delay, etc.
- Movement pattern: node movement in VANETs differs from that of Mobile Ad-hoc Networks (MANETs). In fact, in MANETs, mobile nodes are free to move anywhere at any time. However, in VANET, vehicles follow the topology of road networks of the geographic areas where they drive. In general, there are three situations: urban area, rural area and highway. As shown in Figure 2, the urban area has more complex road network, denser in terms of vehicles number than the rural area. Furthermore, it contains more obstacles, traffic signals and RSUs whenever compared to rural area and highway. In the latter, vehicles move in one direction over many lanes. The spatial attributes of the road network have an impact on the communication efficiency and effectiveness.
- Traffic density: it ranges from high to low density, depending on the geographic area (i.e., high traffic density in urban area and low traffic density in rural area and highway) and the time factor (i.e., low traffic density during off-peak hours and high traffic during rush hours). Traffic density raises crucial challenges related to the design of efficient VANET communication protocols. For instance, in rural areas with very low traffic density, data dissemination protocols must deal with the network disconnection issue. However, advanced data dissemination mechanisms should be used to avoid the well known broadcast storm issue in the case of very high traffic density, especially in urban area during rush hours.
- Heterogeneity: VANET nodes have different characteristics and capabilities. For instance, vehicles are moving nodes, which have different communication ranges, sensing capabilities and categories (i.e., private, authority and maintenance vehicles). Whereas RSUs are stationary nodes placed in some pertinent locations and equipped with complete ad-hoc features.

## 3. VANET Applications

According to [19], VANET applications are categorized as safety, traffic efficiency and infotainment applications. Figure 3 illustrates a taxonomy of VANET applications and related use cases.

![[Pasted image 20230818163028.png]]
Fig. 3 Taxonomy of VANET applications

The following provides a description of the main application use cases in each category.

### 3 .1 Safety Applications

Safety applications aim to warn drivers at the right time about dangerous situations in the road in order to enhance driving safety. In [18], some examples of safety use cases and their related requirements are introduced. In the following, we provide a brief description of the main use cases:

- Cooperative Forward Collision Warning: the goal of this use case is to avoid rear-end collisions with other vehicles by providing assistance to drivers. In fact, rear-end collisions are generally caused by driver disturbance or sudden braking. To avoid a crash, concerned vehicles share relevant information such as position, speed and direction. When a critical situation (e.g., insufficient safety distance) is detected, the vehicle warns its driver.
- Pre-Crash Sensing/Warning: Unlike the Cooperative Forward Collision Warning, this use case assumes that a crash is unavoidable and will take place [22]. In such cases, the involved vehicles exchange in an efficient way the related information with neighbouring vehicles in order to enable a better usage of vehicle’s actuators. 
- Hazardous Location V 2 V Notification: the goal of this use case is to share pertinent information about dangerous locations on the roadway (e.g., potholes, bottleneck, etc.) between vehicles in certain area. To this end, the vehicle detecting a dangerous location uses the information for optimizing its safety systems then broadcasts it to neighbouring vehicles in the surrounding area. Through V 2 V communications, the information is then progressively shared with other concerned vehicles. Information about dangerous locations on the roadway can also be transmitted from external service providers to RSUs, which in turn send it to some vehicles in their communication ranges. Thereafter, vehicles receiving the information can disseminate it to others via V 2 V communications.

### 3.2. Traffic efficiency applications

Traffic efficiency applications aim to enhance the efficiency of transportation systems by providing traffic related information to drivers or road operators. In order to achieve this goal, traffic information should be exchanged through the VANET. Therefore, road-users and road operators will respectively benefit from shorter travel times as well as from reduced costs of roads construction and maintenance. In the following, we provide a brief description of some traffic efficiency use cases introduced in the CAR-2-CAR Communication Consortium [18].

- Enhanced Route Guidance and Navigation: it enables the infrastructure owner to collect traffic data of a large region to be used later for predicting traffic congestion on roadways. Predicted information will be then transmitted to vehicles via RSUs. Hence, driver will be notified about the current and the expected traffic throughout the region, expected delays to reach his destination and better routes that might exist to avoid some congested roads. This will undoubtedly lead to improve the overall efficiency of the transportation system.
- Green Light Optimal Speed Advisory: it provides information related to the location of a signalized intersection and the signal timing (i.e., time to switch the light signal) to vehicles approaching the intersection, which contributes to smoother driving and avoid stopping. Receiving such information at the right time, the vehicle can calculate the optimal speed to reach the intersection when the traffic signal is green, and therefore the driver will not have to decrease the speed of the vehicle or to stop. This fact will probably bring about a significant increase in the traffic flow and fuel economy.

### 3.3. Infotainment and others

Non safety or traffic efficiency use cases are classified in this category. Some of these use cases provide entertainment or information on a regular basis to drivers. Other ones are transparent to the driver and they play important role for improving the vehicle functions.
- Internet Access in Vehicle: it allows drivers and eventually passengers to access the Internet via the VANET. In this case, RSUs act as internet gateways.
- Point of Interest Notification: it allows traders and advertisement companies to advertise their business promotions to nearby vehicles. To this end, an RSU broadcasts the advertisement information (e.g., location, hours of operation and pricing) to the contacted vehicles. The received advertisements will be filtered by each vehicle with respect to the driver profile and context then appropriate advertisements are presented to the driver.

## 4. Open Issues and Challenges

This section addresses the main research challenges and open issues to be considered for designing efficient and a cost-effective protocols and applications for VANET. 
### 4 .1 Data Dissemination in VANETS 
Data dissemination is a key and hot topic in vehicular networks. The challenge is to inform vehicles about interesting events while avoiding the broadcast storm problem. In figure 4, we provide a new taxonomy of the existing protocols, which we classify as: broadcast or geocast protocols. The main goal of broadcast protocols is to deliver a given event message to all vehicles in the network without exception. However, the aim of geo-cast protocols is to disseminate the event message to a target set of vehicles driving in a geographical area, named Zone of Relevance (ZOR) [21], [22]. In the following, we introduce crucial challenges facing the design efficient data dissemination protocols.

![[Pasted image 20230818163316.png]]
Fig. 4. Taxonomy of Data Dissemination Protocols in VANETs

- Zone of Relevance Computation: Efficient data dissemination of safety events could be done through geocast approach, which requires delivering information to vehicles inside the ZOR. In fact, the most important step of any geocast based data dissemination protocol is the computation of the ZOR for a given event. Big data collected from vehicles and RSUs hides hidden mobility patterns that could be of use to design an efficient data dissemination approach and more specifically to solve the ZOR computation problem [57]. 
- Event lifetime management: In VANET, the disseminated message should be kept alive in the ZOR for a certain delay to inform new arriving vehicles. Therefore, new mechanisms must be introduced to keep relevant events alive inside the ZOR, without the need of rebroadcasting event messages as the existing approaches do.

### 4.2. Data Aggregation in VANET

As VANET is a very dynamic network due the high mobility of vehicles, information must be exchanged between mobile vehicles in an efficient way by avoiding as far as possible the broadcast storm problem. In this respect, data aggregation appears as an interesting approach allowing to integrate several data about similar events to generate a summary (or aggregate) leading to reduce network traffic. Therefore, the design of an efficient data aggregation approach that combines correlated traffic information is a challenging issue [26], [27]. The data aggregation process must deal with the following challenges:

- How to decide if two or more messages must be aggregated or not? 
- How to select timely data to be aggregated? 
- How to consider data from far vehicles? 
- How to filter the unnecessary and duplicated messages to avoid affecting the accuracy of the shared traffic information? 
- How to take into consideration the road traffic signals and speed limitations?

### 4 .3. RSUs Deployment in VANETs

In VANET, RSUs can collect real-time data, from moving vehicles, then transmit it to traffic information centres for further analysis. In addition, RSUs disseminate important information that they receive from the traffic management centres to vehicles. However, communication with enormous number of vehicles driving in a big city requires the deployment of large number of RSUs in different locations [9], [28], [29]. In this respect, an efficient RSUs deployment strategy must be introduced. The challenge is to (i) minimize the number of RSUs as much as possible in order to reduce the deployment cost; and (ii) to maximize the coverage ratio.

## 5 . Conclusion 

In this study, first we have presented an overview of VANETs, including a detailed description of VANETs architecture, characteristics and applications. Thereafter, we have discussed the main research challenges and open issues to be considered for designing efficient and a cost effective VANET protocols and applications. Indeed, pertinent perspectives, challenges, shortcomings in the area and some related research directions have been introduced.