sudo insmod ./nvmev.ko memmap_start=100G memmap_size=65537M cpus=7,8,9

# sudo rmmod nvmev

fio --name=zns_write_test --ioengine=io_uring --cmd_type=nvme \
    --filename=/dev/nvme1n1 --rw=write --bs=4k --iodepth=32 \
    --numjobs=1 --time_based --runtime=60s --ramp_time=10s --zonemode=zbd --direct=1 \
    --registerfiles --fixedbufs --hipri --sqthread_poll --size=80% --output-format=json \
    # --numjobs=16 --offset_increment=1z --group_reporting