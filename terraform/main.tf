#configure gcp provider

provider "google" {
    project = var.project_id
    region = var.region
}

#create VPC

resource "google_compute_network" "vpc" {
    name = "devops-vpc"
    auto_create_subnetworks = false
}

#create subnetworks
resource "google_compute_subnetwork" "subnet" {
    name = "devops-subnet"
    ip_cidr_range = "10.0.0.0/24"
    region = var.region
    network = google_compute_network.vpc.id

}

#create VM instance 

resource "google_compute_instance"  "vm"{
    name = "devops-vm"
    machine_type = "e2-micro"
    zone = "${var.region}-b"

    boot_disk {
        initialize_params{
            image = "debian-cloud/debian-11"
        }
    }
    network_interface {
        network = google_compute_network.vpc.id
        subnetwork = google_compute_subnetwork.subnet.id
        access_config {} #public ip
        
    }
}