## Task – Terraform + Ansible + Docker Swarm + Monitoring
📌 Project Overview

This project provisions and configures a complete Dev & Prod infrastructure on AWS using:

Terraform → Infrastructure provisioning (VPC, EC2, Subnets, NAT, Security Groups)

Ansible → Configuration management (PostgreSQL, Docker, App setup)

Docker Swarm → Container orchestration

Prometheus + Grafana → Monitoring

Environment Separation → dev & prod using .tfvarsk

## Components Created:

Custom VPC

Public Subnet

Private Subnet

Internet Gateway

NAT Gateway

Route Tables

Security Groups

Key Pairs

EC2 Instances (Dev & Prod)

## Step 1: Terraform – Infrastructure Provisioning
What Was Implemented :

Created sejal-dev and sejal-prod environments

EC2 in private subnet

NAT Gateway for outbound internet

Separate security groups

SSH key pair creation via Terraform

Variables managed using dev.tfvars and prod.tfvars

## Commands Used
For Dev:

terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars

For production:
terraform apply -var-file=prod.tfvars

## Step 2: Ansible – Configuration Management
Configured:

PostgreSQL installation

Database creation

User creation

Log rotation

Docker installation

Docker Swarm initialization

## Step 3: Docker Swarm Deployment
Services Deployed:

Application Service

PostgreSQL (containerized where required)

Prometheus

Grafana

Commands Used:

docker swarm init
docker service create
docker stack deploy
docker service ls

## Step 4: Monitoring Setup
Prometheus :

Configured to scrape:

PostgreSQL metrics

Node metrics

Verified target status in Prometheus UI

Grafana :

Connected Prometheus as data source

Imported dashboards

Verified:

pg_postmaster_start_time_seconds

Database metrics

Container health