sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd1
sudo vgcreate vg_datos /dev/sdd1
sudo fdisk /dev/sdd
sudo fdisk /dev/sdc
sudo pvcreate /dev/sdc1
sudo vgextend vg_datos /dev/sdc1
sudo fdisk /dev/sdd
sudo pvcreate /dev/sdd2
sudo vgcreate vg_temp /sdd2
sudo vgcreate vg_temp /dev/sdd2
sudo lvcreate -L +5M vg_datos -n lv_docker
sudo lvcreate -l +100%FREE vg_datos -n lv_workareas 
sudo lvcreate -l +100%FREE vg_temp -n lv_swap
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
sudo systemctl restart docker
sudo systemctl status docker
sudo mkdir /work
sudo mount /dev/mapper/vg_datos-lv_workareas /work/
