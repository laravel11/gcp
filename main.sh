#!/bin/bash

# GCP instance creation command
gcloud compute instances create develop \
--project=utility-zenith-422322-v5 \
--zone=us-central1-a \
--machine-type=e2-standard-8 \
--network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
--metadata=enable-osconfig=TRUE \
--can-ip-forward \
--maintenance-policy=MIGRATE \
--provisioning-model=STANDARD \
--service-account=123949914299-compute@developer.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
--enable-display-device \
--tags=http-server,https-server,lb-health-check \
--create-disk=auto-delete=yes,boot=yes,device-name=develop,image=projects/debian-cloud/global/images/debian-12-bookworm-v20240701,mode=rw,size=75,type=projects/utility-zenith-422322-v5/zones/europe-west12-c/diskTypes/pd-ssd \
--no-shielded-secure-boot \
--shielded-vtpm \
--shielded-integrity-monitoring \
--labels=goog-ops-agent-policy=v2-x86-template-1-3-0,goog-ec-src=vm_add-gcloud \
--reservation-affinity=any

# Run the setup script on the created instance
gcloud compute ssh develop --zone=us-central1-a --command "sudo bash -s" < setup_script.sh
