## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network_Diagram]()

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat.

  - _install-dvwa.yml_
  - _install_elk.yml_
  - _install_filebeat.yml_

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

The configuration details of each machine may be found below.

| Name                 | Function    | IP Address | Operating System |
|:---------------------|:------------|:-----------|:-----------------|
| Jump-Box-Provisioner | Gateway     | 10.1.0.4   | Linux            |
| Web-1                | Application | 10.1.0.5   | Linux            |
| Web-2                | Application | 10.1.0.6   | Linux            |
| Web-3                | Application | 10.1.0.7   | Linux            |
| ELK-1                | ELK Stack   | 10.2.0.4   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _140.24.131.69_

Machines within the network can only be accessed by Jump-Box-Provisioner at the IP address 52.147.205.130.

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses   |
|:---------------------|:--------------------|:-----------------------|
| Jump-Box-Provisioner | Yes                 | 140.24.131.69          |
| Web-1                | No                  | 10.1.0.4               |
| Web-2                | No                  | 10.1.0.4               |
| Web-3                | No                  | 10.1.0.4               |
| ELK-1                | Yes / No            | 20.97.19.14 / 10.1.0.4 |


### ELK Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because saves time and provides build process consistency.

The playbook implements the following tasks:
- _Prepares the virtual machine to run the ELK stack docker container_
- _Installs the docker and python3 packages_
- _Downloads and launches the ELK stack docker container_

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker_ps_Output]()


### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _10.1.0.5_
- _10.1.0.6_
- _10.1.0.7_
- _10.2.0.4_

We have installed the following Beats on these machines:
- _Filebeat_

These Beats allow us to collect the following information from each machine:
- _Filebeat collects log files that the ELK server can use to analyze log events such as when files are updated and when.  It can also send log files from applications like Apache to analyze web site traffic and actions._


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- _Copy the install-filebeat.yml file to /etc/ansible._
- _Update the hosts file to include the machine IP address to monitor._
- _Run the playbook, and navigate to 20.97.19.14:5601/app/kibana to check that the installation worked as expected._
