# Check existing swap space and memory
sudo swapon --show
free -h

# Allocate a 2GB swap file (adjust count for desired size, e.g., 2G = 1024 * 2)
sudo fallocate -l 2G /swapfile

# Alternative allocation method if fallocate is unsupported:
# sudo dd if=/dev/zero of=/swapfile bs=1M count=2048

# Secure the swap file permissions (only root can read/write)
sudo chmod 600 /swapfile

# Set up the Linux swap area on the file
sudo mkswap /swapfile

# Enable the swap file immediately
sudo swapon /swapfile

# Make the swap file permanent across reboots by adding an entry to /etc/fstab
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Verify swap configuration
sudo swapon --show
free -h
