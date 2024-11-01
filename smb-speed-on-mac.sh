#!/bin/bash

# Commands that decrease security

# Check if the nsmb.conf file exists and remove it if it does
if [ -f /private/etc/nsmb.conf ]; then
    rm /private/etc/nsmb.conf
fi

# Create a new nsmb.conf file with default section
echo "[default]" >> /etc/nsmb.conf

# Disable SMB signing (decreases security)
echo "signing_required=no" >> /etc/nsmb.conf

# Disable negotiation validation (decreases security)
echo "validate_neg_off=yes" >> /etc/nsmb.conf

# End Section

# Commands with neutral or mixed impact on security

# Enable support for named streams (neutral)
echo "streams=yes" >> /etc/nsmb.conf

# Disable change notifications (neutral, but might affect operational efficiency)
echo "notify_off=yes" >> /etc/nsmb.conf

# Enable soft mounts (neutral, but could impact data availability)
echo "soft=yes" >> /etc/nsmb.conf

# Disable directory caching (neutral, but impacts performance)
echo "dir_cache_max_cnt=0" >> /etc/nsmb.conf
echo "dir_cache_max=0" >> /etc/nsmb.conf
echo "dir_cache_off=yes" >> /etc/nsmb.conf

# End Section

# Commands that improve or do not affect security significantly

# Disable NetBIOS and use direct hosting over TCP/IP (improves security)
echo "port445=no_netbios" >> /etc/nsmb.conf

# Set SMB protocol version to SMB 2 or later (improves security)
echo "protocol_vers_map=4" >> /etc/nsmb.conf

# Enable multi-channel support and prefer wired connections (neutral, typically safe)
echo "mc_on=yes" >> /etc/nsmb.conf
echo "mc_prefer_wired=yes" >> /etc/nsmb.conf

# Prevent creation of .DS_Store files on network shares (neutral, improves performance)
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# End Section

# Exit script
exit